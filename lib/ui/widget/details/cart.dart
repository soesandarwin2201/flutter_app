import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widget/details/cartCounter.dart';

import '../../../model/product_model.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
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
