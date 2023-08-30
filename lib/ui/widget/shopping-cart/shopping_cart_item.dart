import 'package:flutter/material.dart';
import 'package:flutter_app/controller/card_controller.dart';
import 'package:get/get.dart';

import '../../../model/cart_item.dart';
import '../../../utlis/customeText.dart';

class CartItemWidget extends StatefulWidget {
  final CartItemModel cartItem; // Add this line to define the parameter

  CartItemWidget({Key? key, required this.cartItem})
      : super(key: key); // Add this constructor

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  final cartController = Get.find<CartController>();
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.cartItem.image
                  .isNotEmpty // Check if the image URL is not empty
              ? Image.network(
                  widget.cartItem.image,
                  width: 80,
                )
              : Container(),
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
                  text: widget.cartItem.name, // Use widget.cartItem
                  weight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      cartController.decreaseQuantity(
                          widget.cartItem); // Use widget.cartItem
                      setState(() {
                        if (numOfItems > 1) {
                          numOfItems--;
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: widget.cartItem.quantity
                          .toString(), // Use widget.cartItem
                      weight: FontWeight.w300,
                      size: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      cartController.increaseQuantity(
                          widget.cartItem); // Use widget.cartItem
                      setState(() {
                        numOfItems++;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "\$${widget.cartItem.cost}", // Use widget.cartItem
            size: 22,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
