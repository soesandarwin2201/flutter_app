import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("this is home page"),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor:
              Colors.black, // Optional: Set the color of the selected item
          unselectedItemColor:
              Colors.grey, // Optional: Set the color of the unselected items
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.heat_pump_rounded),
              label: 'heart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'noti',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.male),
              label: 'user',
            ),
          ],
        ),
      ),
    );
  }
}
