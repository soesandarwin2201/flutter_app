import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_app/utlis/appbar.dart';
import 'package:flutter_app/view/favourite.dart';
import 'package:flutter_app/view/home.dart';
import 'package:flutter_app/view/login.dart';
import 'package:flutter_app/view/noti.dart';
import 'package:flutter_app/view/signup.dart';
import 'package:flutter_app/view/user_profile.dart';
import 'package:get/get.dart';
import 'package:flutter_app/utlis/appbar.dart';

import '../controller/auth_controller.dart';
import '../utlis/custom_animated_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final authController = Get.find<AuthController>();
  int _currentIndex = 0;
  bool isLoggedIn = true;

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(),
        body: getBody(),
        bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.star),
          title: Text('Users'),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.notifications),
          title: Text(
            'Messages ',
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Settings'),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      Favourite(),
      Notifications(),
      authController.isLoggedIn ? UserProfile() : LoginPage(),
    ];

    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
