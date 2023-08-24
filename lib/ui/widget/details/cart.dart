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
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: Text("Size: ${product.price}"),
        )
      ],
    );
  }
}
