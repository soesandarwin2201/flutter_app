import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../contants/routes.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.dashboard);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: width,
                height: height * 0.2,
                color: Colors.lightBlue,
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.1),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/user.png'),
                  radius: 70,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(authController.user.value.email,
                style: TextStyle(fontSize: 18.0)),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15), // Add padding at the bottom
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)), // Add bottom border
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("address"),
                Text("user address"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15), // Add padding at the bottom
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)), // Add bottom border
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("payment"),
                Text("user payment"),
              ],
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.only(left: 20.0),
              width: width * 0.5,
              height: 50.0,
              child: GestureDetector(
                onTap: () {
                  authController.signout();
                },
                child: Center(
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
