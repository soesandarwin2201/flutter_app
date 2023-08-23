import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth_controller.dart';
import 'package:flutter_app/controller/product_controller.dart';
import 'package:flutter_app/utlis/app_page.dart';
import 'package:flutter_app/view/dashboard.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'utlis/app_page.dart';
import 'contants/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
    Get.put(ProductController());
  });
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
