import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/card_controller.dart';
import '../../../model/cart_item.dart';
import '../../../utlis/customBtn.dart';
import '../../../utlis/customeText.dart';
import 'shopping_cart_item.dart';

class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final cartController = Get.find<CartController>();

    print("Total Cart Price in UI: ${cartController.totalCartPrice.value}");
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
            FutureBuilder<List<CartItemModel>>(
              future: authController.getCartItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: CustomText(
                      text: "Error loading cart items",
                      size: 18,
                      color: Colors.black,
                      weight: FontWeight.w400,
                    ),
                  );
                } else {
                  final cartItems = snapshot.data ?? [];

                  if (cartItems.isEmpty) {
                    return Center(
                      child: CustomText(
                        text: "Your cart is empty.",
                        size: 18,
                        color: Colors.black,
                        weight: FontWeight.w400,
                      ),
                    );
                  }

                  // You can call updateCartTotalPrice() here or anywhere else needed

                  return Column(
                    children: cartItems
                        .map((cartItem) => CartItemWidget(
                              cartItem: cartItem,
                            ))
                        .toList(),
                  );
                }
              },
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            cartController.changeCartTotalPrice(authController.userModel.value);
          },
          child: Text('Update Total Cart Price Manually'),
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
            ),
          ),
        ),
      ],
    );
  }
}
