import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final IconData icon;
  final ImageProvider image;
  final String text;

  const SmallCard(
      {required this.icon, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.blue),
            SizedBox(height: 8),
            Image(image: image, width: 36, height: 36),
            SizedBox(height: 8),
            Text(text,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
