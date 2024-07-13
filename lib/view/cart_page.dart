import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lite_shopper_pro/controller/product_controller.dart';
import 'package:lite_shopper_pro/model/product_model.dart';
import 'package:lite_shopper_pro/view/checkout_page.dart';
import 'package:lite_shopper_pro/view/product_details_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ProductController productController = Get.put(ProductController());
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              padding: const EdgeInsets.all(16).copyWith(bottom: 100),
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
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(currentProduct.imageUrl),
                                    fit: BoxFit.cover)),

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
                                    style: const TextStyle(
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
                                  // Text(
                                  //   'Size',
                                  //   style: const TextStyle(
                                  //     fontSize: 15,
                                  //     color: Color(0xFF2A2A2A),
                                  //   ),
                                  // ),
                                  // const SizedBox(width: 4),
                                  // Container(
                                  //   width: 25,
                                  //   height: 26,
                                  //   alignment: Alignment.center,
                                  //   decoration: BoxDecoration(
                                  //     color: const Color(0xFFF9F9F9),
                                  //     borderRadius: BorderRadius.circular(4),
                                  //   ),
                                  //   child: Text(
                                  //     29.toString(),
                                  //     style: const TextStyle(
                                  //       fontSize: 15,
                                  //       color: Color(0xFF555555),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    width: 115,
                                    color: const Color(0xFFF9F9F9),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (quantity != 1) {
                                                quantity--;
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.remove),
                                          color: const Color(0xFF2A2A2A),
                                        ),
                                        Container(
                                          width: 26,
                                          height: 25,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF0072C6)
                                                .withOpacity(.12),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          child: Text(
                                            quantity.toString(),
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF2A2A2A),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                          icon: const Icon(Icons.add),
                                          color: const Color(0xFF2A2A2A),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '₦ ${quantity * currentProduct.price}',
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
                      Positioned(
                        right: 8,
                        top: 8,
                        child: IconButton(
                          onPressed: () {
                            productController.removeFromCart(index);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9D9D9D),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '₦ ${getSum(productController.cartProduct)}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: productController.cartProduct.isNotEmpty
                        ? () {
                            Get.to(() => CheckoutPage());
                          }
                        : null,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    minWidth: 141,
                    height: 52,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: const Color(0xFF0072C6),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double getSum(List<ProductModel> products) {
  double sum = 0;
  for (int i = 0; i < products.length; i++) {
    sum += products[i].price;
  }
  return sum;
}
