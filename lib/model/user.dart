import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/model/cart_item.dart';

class UserModel {
  static const ID = "id";
  static const EMAIL = "email";
  static const CART = "cart";

  late String id;
  late String email;
  late List<CartItemModel> cart;

  UserModel({required this.id, required this.email, required this.cart});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    if (data != null) {
      email = data[EMAIL] as String;
      id = data[ID] as String;
      cart = _convertCartItems(data[CART] as List? ?? []);
    }
  }

  List<CartItemModel> _convertCartItems(List cartFomDb) {
    List<CartItemModel> _result = [];
    if (cartFomDb.length > 0) {
      cartFomDb.forEach((element) {
        _result.add(CartItemModel.fromMap(element));
      });
    }
    return _result;
  }

  List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}
