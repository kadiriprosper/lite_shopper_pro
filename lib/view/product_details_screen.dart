import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lite_shopper_pro/controller/product_controller.dart';
import 'package:lite_shopper_pro/view/dashboard_page.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductController productController = Get.put(ProductController());
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEAEAEA).withOpacity(.4),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      PageView(
                        children: [
                          Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFEAEAEA).withOpacity(.4),
                              image: DecorationImage(
                                image: NetworkImage(
                                  productController.selectedProduct!.imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: ProductSlideIndicator(
                                onPage: index == 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productController.selectedProduct!.category,
                        style: const TextStyle(
                          color: const Color(0xFF2A2A2A),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        productController.selectedProduct!.name,
                        style: const TextStyle(
                          color: Color(0xFF2A2A2A),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        productController.selectedProduct!.name,
                        style: const TextStyle(
                          color: Color(0xFF2A2A2A),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Text(
                            '100 sold',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF555555),
                            ),
                          ),
                          Icon(
                            Icons.star_half_rounded,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '(32 reviews)',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF555555),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),
                      Text(
                        productController.selectedProduct!.description,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF555555),
                        ),
                      ),
                      //SIZE
                      productController.selectedProduct!.category == 'shoe'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                const Text(
                                  'Size',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Color(0xFF2A2A2A),
                                  ),
                                ),
                                Wrap(
                                  runSpacing: 12,
                                  spacing: 12,
                                  children: List.generate(
                                    5,
                                    (index) => SizeLabel(
                                      sizeLabel: (32 + index).toString(),
                                      isSelected: index == 2,
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      //COLOUR
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Text(
                            'Colours',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xFF2A2A2A),
                            ),
                          ),
                          Wrap(
                            runSpacing: 12,
                            spacing: 12,
                            children: List.generate(
                              1,
                              (index) => InkWell(
                                onTap: () {},
                                child: ColorLabelWidget(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Text(
                            'Quantity',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xFF2A2A2A),
                            ),
                          ),
                          Container(
                            height: 34,
                            width: 150,
                            color: const Color(0xFFF9F9F9),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              // vertical: 4,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0072C6)
                                        .withOpacity(.12),
                                    borderRadius: BorderRadius.circular(2),
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
                                  padding: const EdgeInsets.all(0),
                                  icon: const Icon(Icons.add),
                                  color: const Color(0xFF2A2A2A),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CategoryLabel(category: 'More from kitchen'),
                          const SizedBox(height: 20),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 4 / 6,
                              crossAxisSpacing: 21,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) {
                              return ProductCard(
                                productModel:
                                    productController.allProducts[index],
                                onTapProduct: () {
                                  productController.selectedProduct =
                                      productController.allProducts[index];

                                  Get.to(() => ProductDetailsScreen());
                                },
                                onTap: () {
                                  productController.addToCart(
                                      productController.allProducts[index]);
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 100),
                        ],
                      )
                    ],
                  ),
                )
              ],
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
                        '₦ ${(productController.selectedProduct!.price * quantity)}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {
                      productController.addToCart(
                        productController.selectedProduct!,
                      );
                    },
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
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon/cart_icon.svg',
                          height: 16,
                          width: 16,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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

class ColorLabelWidget extends StatelessWidget {
  const ColorLabelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 24,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Icon(
        Icons.check,
        size: 16,
        color: Colors.white,
      ),
    );
  }
}

class SizeLabel extends StatelessWidget {
  const SizeLabel({
    super.key,
    required this.sizeLabel,
    required this.isSelected,
    required this.onTap,
  });
  final String sizeLabel;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 26,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0072C6) : const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          sizeLabel,
          style: TextStyle(
            fontSize: 15,
            color: isSelected ? Colors.white : const Color(0xFF555555),
          ),
        ),
      ),
    );
  }
}

class ProductSlideIndicator extends StatelessWidget {
  const ProductSlideIndicator({
    super.key,
    required this.onPage,
  });

  final bool onPage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          onPage ? const Color(0xFF0072C6) : const Color(0xFFE8EAEB),
      radius: 4,
    );
  }
}
