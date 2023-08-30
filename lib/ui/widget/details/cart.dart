import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widget/details/cartCounter.dart';
import 'package:get/get.dart';

import '../../../controller/card_controller.dart';
import '../../../model/cart_item.dart';
import '../../../model/product_model.dart';

class CounterWithFavBtn extends StatelessWidget {
  CounterWithFavBtn({super.key, required this.product, required this.cartItem});
  final ProductModel product;
  final cartController = Get.find<CartController>();
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(cartItem: cartItem),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "Size: ${product.size}",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
