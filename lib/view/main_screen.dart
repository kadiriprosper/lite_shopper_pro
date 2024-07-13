import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lite_shopper_pro/view/all_products_page.dart';
import 'package:lite_shopper_pro/view/cart_page.dart';
import 'package:lite_shopper_pro/view/dashboard_page.dart';
import 'package:lite_shopper_pro/view/my_orders_page.dart';
import 'package:lite_shopper_pro/view/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pages = const [
    DashboardPage(),
    AllProductsPage(),
    CartPage(),
    MyyOrdersPage(),
    ProfilePage(),
  ];
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/home_icon.svg',
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset('assets/icon/home_icon.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon/allProduct.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icon/allProduct.svg',
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
            ),
            label: 'All Products',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon/cart_icon.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icon/cart_icon.svg',
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon/my_orders_icon.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icon/my_orders_icon.svg',
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
            ),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon/profile_icon.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icon/profile_icon.svg',
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
