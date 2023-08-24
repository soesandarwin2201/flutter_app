import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widget/details/smallCard.dart';

import '../../../model/product_model.dart';

class Ingredientcard extends StatelessWidget {
  const Ingredientcard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SmallCard(
          icon: Icons.star,
          image: AssetImage('images/aloe.png'),
          text: product.ingredients,
        ),
        SmallCard(
          icon: Icons.shopping_cart,
          image: AssetImage('images/aloe.png'),
          text: product.ingredients,
        ),
        SmallCard(
          icon: Icons.notifications,
          image: AssetImage('images/aloe.png'),
          text: product.ingredients,
        ),
      ],
    );
  }
}
