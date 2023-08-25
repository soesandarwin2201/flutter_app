import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/card_controller.dart';
import '../../../utlis/customBtn.dart';
import '../../../utlis/customeText.dart';
import 'shopping_cart_item.dart';

class ShoppingCartWidget extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                color: Colors.black,
                text: "Shopping Cart",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() => Column(
                  children: authController.user.value.cart
                      .map((cartItem) => CartItemWidget(
                            cartItem: cartItem,
                          ))
                      .toList(),
                )),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                child: Obx(
                  () => CustomButton(
                    text:
                        "Pay (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})",
                    onTap: () {},
                    bgColor: Colors.black,
                    txtColor: Colors.white,
                    shadowColor: Colors.black,
                  ),
                )))
      ],
    );
  }
}
