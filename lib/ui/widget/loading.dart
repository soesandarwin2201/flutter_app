import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context, String text) {
  showDialog(
    // The user CANNOT close this dialog  by pressing outsite it
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return Dialog(
        // The background color
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // The loading indicator
              const CircularProgressIndicator(),
              const SizedBox(
                width: 15,
              ),
              // Some text
              Text(text)
            ],
          ),
        ),
      );
    },
  );
}
