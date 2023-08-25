import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth_controller.dart';
import 'package:flutter_app/model/cart_item.dart';
import 'package:flutter_app/model/user.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../contants/app_constants.dart';
import '../model/product_model.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  AuthController authController = AuthController.instance;
  RxDouble totalCartPrice = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    ever(authController.userModel, changeCartTotalPrice);
  }

  void addProductToCart(ProductModel product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        String itemId = Uuid().toString();
        authController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": 1,
              "price": product.price,
              "image": product.image,
              "cost": product.price
            }
          ])
        });
        Get.snackbar("Item added", "${product.name} was added to your cart");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      authController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
    }
  }

  void changeCartTotalPrice(UserModel? userModel) {
    totalCartPrice.value = 0.0;
    if (userModel != null && userModel.cart.isNotEmpty) {
      userModel.cart.forEach((cartItem) {
        totalCartPrice.value += cartItem.cost;
      });
    }
  }

  bool _isItemAlreadyAdded(ProductModel product) =>
      authController.userModel.value?.cart
          ?.where((item) => item.productId == product.id)
          ?.isNotEmpty ??
      false;

  void decreaseQuantity(CartItemModel item) {
    if (item.quantity == 1) {
      removeCartItem(item);
    } else {
      removeCartItem(item);
      item.quantity--;
      authController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }

  void increaseQuantity(CartItemModel item) {
    removeCartItem(item);
    item.quantity++;
    logger.i({"quantity": item.quantity});
    authController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }
}
