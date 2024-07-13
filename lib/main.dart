import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lite_shopper_pro/controller/product_controller.dart';
import 'package:lite_shopper_pro/view/cart_page.dart';
import 'package:lite_shopper_pro/view/checkout_page.dart';
import 'package:lite_shopper_pro/view/payment_success_page.dart';
import 'package:lite_shopper_pro/view/product_details_screen.dart';

import 'view/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final productController = Get.put(ProductController());
  await productController.getProducts();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}
