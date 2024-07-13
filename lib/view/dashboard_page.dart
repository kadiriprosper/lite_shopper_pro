import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lite_shopper_pro/controller/product_controller.dart';
import 'package:lite_shopper_pro/model/product_model.dart';
import 'package:lite_shopper_pro/view/product_details_screen.dart';

String getTimeOfDay() {
  if (DateTime.now().hour >= 0 && DateTime.now().hour < 12) {
    return 'Good morning 👋🏽';
  } else if (DateTime.now().hour >= 12 && DateTime.now().hour < 5) {
    return 'Good afternoon 👋🏽';
  } else {
    return 'Good evening 👋🏽';
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final productController = Get.put(ProductController());
  int currentSlide = 0;
  PageController slidePageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Put the logo here'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 49,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE89705),
                    borderRadius: BorderRadius.circular(46),
                    border: Border.all(
                      width: 2,
                      color: const Color(0xFFFFA500),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'AD',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTimeOfDay(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF707070),
                      ),
                    ),
                    const Text(
                      'Ada Dennis',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 36),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  PageView(
                    controller: slidePageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentSlide = value;
                      });
                    },
                    children: List.generate(
                      4,
                      (index) => InkWell(
                        onTap: () {
                          productController.selectedProduct =
                              productController.allProducts[index];
                          Get.to(() => ProductDetailsScreen());
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            // gradient: const LinearGradient(
                            //   colors: [
                            //     Color(0xFF0072C6),
                            //     Color(0xFF003760),
                            //   ],
                            // ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 154,
                                width: 154,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      productController
                                          .allProducts[index].imageUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productController
                                            .allProducts[index].category,
                                        style: const TextStyle(
                                          fontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${productController.allProducts[index].name} ₦ ${productController.allProducts[index].price}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: AddToCartButton(
                                      onTap: () {
                                        productController.addToCart(
                                            productController
                                                .allProducts[index]);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SlideIndicator(
                            onTap: () {
                              setState(() {
                                slidePageController.jumpToPage(index);
                              });
                            },
                            onPage: index == currentSlide,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            const CategoryLabel(
              category: 'Our Special Offers',
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6,
                crossAxisSpacing: 21,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  productModel: productController.allProducts[index],
                  onTapProduct: () {
                    productController.selectedProduct =
                        productController.allProducts[index];
                    Get.to(() => ProductDetailsScreen());
                  },
                  onTap: () {
                    productController
                        .addToCart(productController.allProducts[index]);
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            const CategoryLabel(
              category: 'Featured Products',
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6,
                crossAxisSpacing: 21,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  productModel: productController.allProducts[index],
                  onTapProduct: () {
                    productController.selectedProduct =
                        productController.allProducts[index];

                    Get.to(() => ProductDetailsScreen());
                  },
                  onTap: () {
                    productController
                        .addToCart(productController.allProducts[index]);
                  },
                );
              },
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                onPressed: () {},
                height: 42,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                minWidth: 104,
                color: const Color(0xFF0072C6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'View more',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CategoryLabel extends StatelessWidget {
  const CategoryLabel({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
    required this.onTap,
    required this.onTapProduct,
  });

  final ProductModel productModel;
  final VoidCallback onTap;
  final VoidCallback onTapProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapProduct,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA).withOpacity(.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  productModel.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                productModel.category,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                productModel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              const Row(
                children: [
                  Icon(
                    Icons.star_half_rounded,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 2),
                  Text(
                    '4.5 (100 sold)',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₦ ${productModel.price}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0072C6),
                        ),
                      ),
                      Text(
                        '₦ ${productModel.price - 200}',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF9D9D9D),
                        ),
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: onTap,
                    minWidth: 0,
                    child: Container(
                      width: 36,
                      height: 28,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF0072C6).withOpacity(.12),
                      ),
                      child: SvgPicture.asset(
                        'assets/icon/cart_icon.svg',
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF0072C6),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8.2,
            child: Container(
              width: 30.8,
              height: 30.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: const Color(0xFF6C6C6C),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icon/favourite.svg',
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideIndicator extends StatelessWidget {
  const SlideIndicator({
    super.key,
    required this.onPage,
    required this.onTap,
  });

  final bool onPage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: onPage ? Colors.white : const Color(0xFF6C6C6C),
        radius: 4,
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icon/cart_icon.svg',
            height: 12,
            width: 12,
          ),
          const SizedBox(width: 8),
          const Text(
            'Add to cart',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
