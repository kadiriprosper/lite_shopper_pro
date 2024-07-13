import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lite_shopper_pro/controller/product_controller.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/payment_successful.png',
              height: 56,
              width: 56,
            ),
            const SizedBox(height: 8),
            const Text(
              'Payment Successful',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You have successfully placed an order. Details of your order has been sent to your email. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF707070),
              ),
            ),
            const SizedBox(height: 32),
            MaterialButton(
              onPressed: () {
                ProductController productController =
                    Get.put(ProductController());

                Get.back();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              height: 52,
              minWidth: MediaQuery.of(context).size.width,
              textColor: Colors.white,
              color: const Color(0xFF0072C6),
              child: const Text('Okay'),
            ),
          ],
        ),
      ),
    );
  }
}
