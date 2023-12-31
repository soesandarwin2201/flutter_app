import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:flutter_app/ui/widget/productDeatils.dart';
import 'package:flutter_app/utlis/customeText.dart';
import 'package:get/get.dart';

import '../../contants/routes.dart';
import '../../controller/card_controller.dart';
import '../../model/cart_item.dart';

class ProductCard extends StatelessWidget {
  final cartController = Get.find<CartController>();
  final CartItemModel cartItem;
  final ProductModel product;
  ProductCard({super.key, required this.product, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailPage(
          product: product,
          cartItem: cartItem,
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: Offset(3, 2),
                  blurRadius: 7)
            ]),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                product.image,
                width: double.infinity,
              ),
            ),
          ),
          CustomText(
              text: product.name,
              size: 20,
              color: Colors.black,
              weight: FontWeight.bold),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                    text: "${product.price} ks",
                    size: 22,
                    color: Colors.black,
                    weight: FontWeight.bold),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(icon: Icon(Icons.favorite_rounded), onPressed: () {}),
            ],
          )
        ]),
      ),
    );
  }
}
