import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../contants/routes.dart';
import '../ui/theme/appColor.dart';
import '../ui/widget/shopping-cart/shopping_card.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: 25,
        ),
        onPressed: () {
          Get.toNamed(Routes.dashboard);
          // Add your onPressed logic here
        },
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                color: Colors.white,
                child: ShoppingCartWidget(),
              ),
            );
            // Add your onPressed logic here
          },
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 25,
          ),
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
