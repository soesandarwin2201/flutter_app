import 'package:flutter_app/contants/routes.dart';
import 'package:flutter_app/view/favourite.dart';
import 'package:flutter_app/view/home.dart';
import 'package:flutter_app/view/noti.dart';
import 'package:flutter_app/view/user_profile.dart';
import 'package:get/get.dart';

appRoutes() => [
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
    ];
