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
          image: AssetImage('images/aloe.png'),
          text: product.ingredients,
        ),
        SmallCard(
          image: AssetImage('images/natural.png'),
          text: product.ingredient1,
        ),
        SmallCard(
          image: AssetImage('images/honey.png'),
          text: product.ingredient2,
        ),
      ],
    );
  }
}
