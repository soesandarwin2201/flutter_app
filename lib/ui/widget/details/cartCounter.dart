import 'package:flutter/material.dart';
import 'package:flutter_app/controller/card_controller.dart';
import 'package:get/get.dart';

import '../../../model/cart_item.dart';
import '../../theme/appColor.dart';

class CartCounter extends StatefulWidget {
  final CartItemModel cartItem; // Added 'final' keyword

  const CartCounter({Key? key, required this.cartItem})
      : super(key: key); // Used 'super' to pass the key

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  final cartController = Get.find<CartController>();
  late CartItemModel cartItem; // Removed 'final' keyword
  int numOfItems = 1;

  @override
  void initState() {
    super.initState();
    cartItem = widget.cartItem; // Initialize cartItem from widget property
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              cartController.decreaseQuantity(cartItem);
              setState(() {
                if (numOfItems > 1) {
                  numOfItems--;
                }
              });
            },
            child: Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              cartController.increaseQuantity(cartItem);
              setState(() {
                numOfItems++;
              });
            },
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
