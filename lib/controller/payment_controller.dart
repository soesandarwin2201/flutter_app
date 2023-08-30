import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:uuid/uuid.dart';

import '../contants/app_constants.dart';
import '../contants/instance.dart';
import '../model/payment.dart';
import '../ui/widget/payment/payment.dart';
import '../utlis/customeText.dart';

class PaymentsController extends GetxController {
  static PaymentsController instance = Get.find();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String collection = "payments";
  String url = '';
  List<PaymentsModel> payments = [];

  @override
  void onReady() {
    super.onReady();
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51NkftqDUhowcNeth7fJCHiLWjKCYHlxwEkWaAl6lfSUXK3WfLa0Lh2tLkYtwBzWWKY0dXfHzO0mGyW0VLQafIsi100xd0bYTsX",
        androidPayMode: 'test'));
  }

  Future<void> createPaymentMethod() async {
    // Step 1: add card
    PaymentMethod paymentMethod = PaymentMethod();
    paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    ).then((PaymentMethod paymentMethod) {
      return paymentMethod;
    }).catchError((e) {
      print('Error Card: ${e.toString()}');
    });
    paymentMethod != null
        ? processPaymentAsDirectCharge(paymentMethod)
        : _showPaymentFailedAlert();
  }

  Future<void> processPaymentAsDirectCharge(PaymentMethod paymentMethod) async {
    int amount =
        (double.parse(cartController.totalCartPrice.value.toStringAsFixed(2)) *
                100)
            .toInt();
    //step 2: request to create PaymentIntent, attempt to confirm the payment & return PaymentIntent
    final response = await Dio().post(
        '$url?amount=$amount&currency=USD&pm_id=${paymentMethod.id ?? ''}');

    if (response.data != null && response.data != 'error') {
      final paymentIntentX = response.data;
      final status = paymentIntentX['paymentIntent']['status'];
      if (status == 'succeeded') {
        StripePayment.completeNativePayRequest();
        _addToCollection(
            paymentStatus: status, paymentId: paymentMethod.id ?? '');
        authController.updateUserData({"cart": []});
        Get.snackbar("Success", "Payment succeeded");
      } else {
        _addToCollection(
            paymentStatus: status, paymentId: paymentMethod.id ?? '');
      }
    } else {
      //case A
      StripePayment.cancelNativePayRequest();
      _showPaymentFailedAlert();
    }
  }

  void _showPaymentFailedAlert() {
    Get.defaultDialog(
        content: CustomText(
          text: "Payment failed, try another card",
          color: Colors.black,
          size: 20.0,
          weight: FontWeight.bold,
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: "Okay",
                  color: Colors.black,
                  size: 20.0,
                  weight: FontWeight.w600,
                ),
              ))
        ]);
  }

  _addToCollection({required String paymentStatus, required String paymentId}) {
    String id = Uuid().v1();
    firebaseFirestore.collection(collection).doc(id).set({
      "id": id,
      "clientId": authController.userModel.value?.id ?? "",
      "status": paymentStatus,
      "paymentId": paymentId,
      "cart": authController.userModel.value?.cartItemsToJson(),
      "amount": (cartController.totalCartPrice.value ?? 0.0).toStringAsFixed(2),
      "createdAt": DateTime.now().microsecondsSinceEpoch,
    });
  }

  getPaymentHistory() {
    payments.clear();
    firebaseFirestore
        .collection(collection)
        .where("clientId", isEqualTo: authController.userModel.value?.id)
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((doc) {
        PaymentsModel payment = PaymentsModel.fromMap(doc.data());
        payments.add(payment);
      });

      logger.i("length ${payments.length}");
      Get.to(() => PaymentsScreen());
    });
  }
}
