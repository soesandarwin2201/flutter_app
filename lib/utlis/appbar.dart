import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../ui/theme/theme.dart';

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
          // Add your onPressed logic here
        },
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
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
