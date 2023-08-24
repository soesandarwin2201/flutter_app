import 'package:flutter/material.dart';
import 'package:flutter_app/controller/product_controller.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:flutter_app/ui/widget/prouctCard.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({Key? key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
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
          return GridView.count(
            crossAxisCount: 1,
            childAspectRatio: .66,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 22,
            crossAxisSpacing: 20,
            children: products.map((product) {
              return ProductCard(product: product);
            }).toList(),
          );
        }
      },
    );
  }
}
