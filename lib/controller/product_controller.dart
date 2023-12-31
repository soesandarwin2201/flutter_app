import 'package:flutter_app/model/product_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() {
    return firebaseFirestore.collection(collection).snapshots().map(
      (query) {
        final productsList = query.docs
            .map(
              (item) =>
                  ProductModel.fromMap(item.data() as Map<String, dynamic>),
            )
            .toList();
        productsList.forEach((product) {});

        return productsList;
      },
    );
  }
}
