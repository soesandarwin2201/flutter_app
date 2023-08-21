import 'package:flutter/material.dart';
import 'package:flutter_app/utlis/app_page.dart';
import 'package:flutter_app/view/dashboard.dart';
import 'package:get/get.dart';
import 'utlis/app_page.dart';
import 'contants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      initialRoute: Routes.dashboard,
      getPages: appRoutes(),
    );
  }
}
