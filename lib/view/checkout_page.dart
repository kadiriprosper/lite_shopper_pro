import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lite_shopper_pro/controller/product_controller.dart';
import 'package:lite_shopper_pro/view/cart_page.dart';
import 'package:lite_shopper_pro/view/payment_success_page.dart';
import 'package:lite_shopper_pro/view/product_details_screen.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order list',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2A2A2A),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  textColor: Color(0xFF0072C6),
                  child: Text('Edit'),
                ),
              ],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productController.cartProduct.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final currentProduct = productController.cartProduct[index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 152,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFF9F9F9),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(currentProduct.imageUrl),
                              fit: BoxFit.cover),
                        ),
                        // child: ,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentProduct.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2A2A2A),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const ColorLabelWidget(),
                              const SizedBox(width: 3),
                              const Text(
                                'Blue',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF555555),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                width: 1,
                                height: 12,
                                color: const Color(0xFFBDBDBD),
                              ),
                              const SizedBox(width: 4),
                              //     Text(
                              //       'Size',
                              //       style: const TextStyle(
                              //         fontSize: 15,
                              //         color: Color(0xFF2A2A2A),
                              //       ),
                              //     ),
                              //     const SizedBox(width: 4),
                              //     Container(
                              //       width: 25,
                              //       height: 26,
                              //       alignment: Alignment.center,
                              //       decoration: BoxDecoration(
                              //         color: const Color(0xFFF9F9F9),
                              //         borderRadius: BorderRadius.circular(4),
                              //       ),
                              //       child: Text(
                              //         29.toString(),
                              //         style: const TextStyle(
                              //           fontSize: 15,
                              //           color: Color(0xFF555555),
                              //         ),
                              //       ),
                              //     ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 26,
                                height: 25,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF0072C6).withOpacity(.12),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: const Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: const Color(0xFF2A2A2A),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                width: 1,
                                height: 12,
                                color: const Color(0xFFBDBDBD),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '₦ ${currentProduct.price}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2A2A2A),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Personal information',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2A2A2A),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  textColor: Color(0xFF0072C6),
                  child: Text('Edit'),
                  padding: const EdgeInsets.all(0),
                  minWidth: 0,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 78,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF9F9F9),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/contact.svg',
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Ada Dennis',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2A2A2A),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/phone_icon.svg',
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '09100000000',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2A2A2A),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icon/mail_icon.svg',
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'ad@gmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2A2A2A),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery option',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2A2A2A),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  textColor: Color(0xFF0072C6),
                  child: Text(
                    'Edit',
                  ),
                  padding: const EdgeInsets.all(0),
                  minWidth: 0,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF9F9F9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icon/delivery_icon.svg',
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Pick up point',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2A2A2A),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Ikeja, Lagos',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2A2A2A),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Price summary',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2A2A2A),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF9F9F9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total price',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF555555),
                        ),
                      ),
                      Text(
                        '₦ ${getSum(productController.cartProduct)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2A2A2A),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery fee',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF555555),
                        ),
                      ),
                      const Text(
                        '₦0.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2A2A2A),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF555555),
                        ),
                      ),
                      const Text(
                        '₦ 0.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2A2A2A),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF555555),
                        ),
                      ),
                      Text(
                        '₦ ${getSum(productController.cartProduct)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2A2A2A),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 38),
            Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    height: 52,
                    minWidth: 0,
                    elevation: 0,
                    color: const Color(0xFFF9F9F9),
                    child: const Text('Cancel'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Get.bottomSheet(
                        PaymentBottomSheet(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16).copyWith(
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero,
                          ),
                        ),
                      );
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 8,
                    ),
                    height: 52,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: const Color(0xFF0072C6),
                    child: const Text(
                      'Proceed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({
    super.key,
  });

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  final productController = Get.put(ProductController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16).copyWith(
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select a payment option',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: Color(0xFF2A2A2A),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 98,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/card.png'),
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  Text(
                    'Add a new Card',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0072C6).withOpacity(.2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    hintText: 'Enter your full name',
                    label: 'Full name',
                    textInputType: TextInputType.name,
                    validator: (value) {
                      if (value != null && value.length > 3) {
                        return null;
                      } else {
                        return 'input a valid name';
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email address',
                    label: 'Email address',
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != null && value.isEmail) {
                        return null;
                      } else {
                        return 'input a valid email address';
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: numberController,
                    hintText: 'Enter your phone number',
                    label: 'Phone number',
                    textInputType: TextInputType.phone,
                    validator: (value) {
                      if (value != null && value.isPhoneNumber) {
                        return null;
                      } else {
                        return 'input a valid phone number';
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            MaterialButton(
              onPressed: () {
                if (formKey.currentState?.validate() == true) {
                  productController.allProducts = [];

                  Get.to(() => PaymentSuccessPage());
                }
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
              disabledColor: const Color(0xFF0072C6).withOpacity(.2),
              child: const Text('Proceed to payment'),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.textInputType,
    required this.validator,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?) validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF2A2A2A),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => widget.validator(value),
          onTap: () {
            setState(() {});
          },
          controller: widget.controller,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 12,
              color: Color(0xFF9D9D9D),
            ),
            contentPadding: const EdgeInsets.all(16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE8EAEB),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE8EAEB),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
