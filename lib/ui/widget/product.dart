import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth_controller.dart';
import 'package:flutter_app/controller/product_controller.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:flutter_app/ui/widget/prouctCard.dart';
import 'package:get/get.dart';

import '../../controller/card_controller.dart';
import '../../model/cart_item.dart';

class Products extends StatelessWidget {
  const Products({Key? key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    final cartController = Get.find<CartController>();
    final authController = Get.find<AuthController>();

    return StreamBuilder<List<ProductModel>>(
      stream: productController.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error loading products"),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text("No products available"),
          );
        } else {
          final products = snapshot.data!;
          return FutureBuilder<List<CartItemModel>>(
            future: authController.getCartItems(),
            builder: (context, cartSnapshot) {
              if (cartSnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (cartSnapshot.hasError) {
                return Center(
                  child: Text("Error loading cart items"),
                );
              } else {
                final cartItems = cartSnapshot.data!;
                return GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: .66,
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 22,
                  crossAxisSpacing: 20,
                  children: products.map((product) {
                    var cartItem = cartItems.firstWhere(
                      (item) => item.productId == product.id,
                      orElse: () => CartItemModel(
                        // Create a default instance here
                        productId: product.id,
                        id: "", // Use appropriate default values
                        image: "",
                        name: "",
                        quantity: 0,
                        cost: 0.0,
                        price: 0.0,
                      ),
                    );
                    return ProductCard(
                      product: product,
                      cartItem: cartItem,
                    );
                  }).toList(),
                );
              }
            },
          );
        }
      },
    );
  }
}
