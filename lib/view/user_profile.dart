import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
            child: Text("Username", style: TextStyle(fontSize: 18.0)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("Username", style: TextStyle(fontSize: 18.0)),
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
        ],
      ),
    );
  }
}
