import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/features/auth/views/profile_view.dart';
import 'package:huungry/features/cart/views/cart_view.dart';
import 'package:huungry/features/home/views/home_view.dart';
import 'package:huungry/features/orderHistory/views/order_history_view.dart';
import 'package:huungry/shared/custom_text.dart';

class Root extends StatefulWidget {
  Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  late List<Widget> screens;
  int currentScreen = 0;

  @override
  void initState() {
    screens = [
      HomeView(),
      CartView(),
      OrderHistoryView(),
      ProfileView(),
    ];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: BottomNavigationBar(
            elevation: 0,
            enableFeedback: false,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.shade500.withOpacity(0.7),
            currentIndex: currentScreen,
            onTap: (index) {
              setState(() => currentScreen = index);
              controller.jumpToPage(currentScreen);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart),
                  label: 'Cart',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_restaurant_sharp),
                  label: 'Order History',
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.profile_circled),
                  label: 'Profile',
              ),
            ],
        ),
      ),
    );
  }
}
