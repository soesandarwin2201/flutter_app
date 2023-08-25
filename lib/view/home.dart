import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widget/product.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Products(),
      ),
    );
  }
}
