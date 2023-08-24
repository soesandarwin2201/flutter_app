import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:flutter_app/ui/theme/theme.dart';
import 'package:flutter_app/ui/widget/details/ingredient.dart';
import 'package:flutter_app/utlis/appbar.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Navbar(),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(children: <Widget>[
                    Ingredientcard(product: product),
                  ]),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
