import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/product_model.dart';
import 'package:flutter_app/ui/theme/appColor.dart';
import 'package:flutter_app/ui/widget/details/cardImage.dart';
import 'package:flutter_app/ui/widget/details/cartBtn.dart';
import 'package:flutter_app/ui/widget/details/ingredient.dart';
import 'package:flutter_app/utlis/appbar.dart';

import 'details/cart.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
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
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: kDefaultPaddin / 2),
                      Ingredientcard(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPaddin),
                        child: Text(
                          product.details,
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
