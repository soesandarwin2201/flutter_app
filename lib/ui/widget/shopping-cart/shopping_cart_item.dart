import 'package:flutter/material.dart';
import 'package:flutter_app/controller/card_controller.dart';
import 'package:get/get.dart';

import '../../../model/cart_item.dart';
import '../../../utlis/customeText.dart';

class CartItemWidget extends StatelessWidget {
  final cartController = Get.find<CartController>();
  final CartItemModel cartItem;

  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            cartItem.image,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding: EdgeInsets.only(left: 14),
                child: CustomText(
                  color: Colors.black,
                  size: 20.0,
                  text: cartItem.name,
                  weight: FontWeight.w500,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      cartController.decreaseQuantity(cartItem);
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: cartItem.quantity.toString(),
                    weight: FontWeight.w300,
                    size: 20.0,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      cartController.increaseQuantity(cartItem);
                    }),
              ],
            )
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "\$${cartItem.cost}",
            size: 22,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
