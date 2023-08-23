import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/controller/product_controller.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:flutter_app/ui/widget/prouctCard.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    return Obx(
      () => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: productController.products.map((ProductModel product) {
          return ProductCard(product: product);
        }).toList(),
      ),
    );
  }
}
