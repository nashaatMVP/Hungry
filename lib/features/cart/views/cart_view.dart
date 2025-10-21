import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/features/cart/widgets/cart_item.dart';
import 'package:huungry/features/checkout/views/checkout_view.dart';
import 'package:huungry/shared/custom_text.dart';

import '../../../shared/custom_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int itemCount = 9;
  late List<int> quantities;

  @override
  void initState() {
    quantities = List.generate(itemCount, (_) => 1);
    super.initState();
  }
  void onAdd (int index) {
    setState(() {
      quantities[index]++;
    });
  }
  void onMin(int index) {
    setState(() {
      if(quantities[index] > 1)
        {
          quantities[index]--;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SizedBox.shrink(),
        centerTitle: true,
        title: CustomText(
          text:  'My Cart',
          color: Colors.black87,
          weight: FontWeight.w600,
          size: 20,
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              clipBehavior: Clip.none,
              padding: const EdgeInsets.only(bottom: 140, top: 10),
              itemCount: itemCount,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(3, 3),
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: CartItem(
                      image: 'assets/test/test.png',
                      text: 'Hamburger',
                      desc: 'Veggie Burger',
                      number: quantities[index],
                      onAdd: () => onAdd(index),
                      onMin: () => onMin(index),
                    ),
                  ),
                );
              },
            ),
          ),

          // Floating total bar
          Positioned(
            right: -10,
            left: -10,
            bottom: -20,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.8),
                    AppColors.primary.withOpacity(0.8),
                    AppColors.primary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(30),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.9),
                //     blurRadius: 3,
                //     offset: const Offset(2, 3),
                //   ),
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.9),
                //     blurRadius: 800,
                //     offset: const Offset(300, 50),
                //   ),
                // ],
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  Gap(8),
                  GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CheckoutView()),
                      ),
                      child: CustomButton(
                        height: 45,
                        text: 'Checkout',
                        gap: 80,
                        widget: CustomText(text: '230\$', size: 14),
                        color: Colors.white,
                        width: double.infinity,
                        textColor: Colors.black,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
