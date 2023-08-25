import 'package:flutter_app/contants/routes.dart';
import 'package:flutter_app/ui/widget/productDeatils.dart';
import 'package:flutter_app/view/dashboard.dart';
import 'package:flutter_app/view/favourite.dart';
import 'package:flutter_app/view/home.dart';
import 'package:flutter_app/view/login.dart';
import 'package:flutter_app/view/noti.dart';
import 'package:flutter_app/view/signup.dart';
import 'package:flutter_app/view/user_profile.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

late final ProductModel product;

appRoutes() => [
      GetPage(
        name: Routes.dashboard,
        page: () => MyHomePage(),
        transition: Transition.native,
        transitionDuration: const Duration(microseconds: 400),
      ),
      GetPage(
        name: Routes.home,
        page: () => HomePage(),
        transition: Transition.native,
        transitionDuration: const Duration(microseconds: 400),
      ),
      GetPage(
        name: Routes.favourite,
        page: () => Favourite(),
        transition: Transition.native,
        transitionDuration: const Duration(microseconds: 400),
      ),
      GetPage(
        name: Routes.notification,
        page: () => Notifications(),
        transition: Transition.native,
        transitionDuration: const Duration(microseconds: 400),
      ),
      GetPage(
        name: Routes.user,
        page: () => UserProfile(),
        transition: Transition.native,
        transitionDuration: const Duration(microseconds: 400),
      ),
      GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        transition: Transition.native,
        transitionDuration: const Duration(microseconds: 400),
      ),
      GetPage(
        name: Routes.signup,
        page: () => SignUpPage(),
        transition: Transition.native,
        transitionDuration: const Duration(microseconds: 400),
      ),
      GetPage(
        name: Routes.details,
        page: () => ProductDetailPage(
          product: product,
        ),
        transition: Transition.native,
        transitionDuration: const Duration(microseconds: 400),
      ),
    ];
