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
  final int itemCount = 3;
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
      appBar: AppBar(toolbarHeight: 0, scrolledUnderElevation: 0,backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 120, top: 10),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CartItem(
                image: 'assets/test/test.png',
                text: 'Hamburger',
                desc: 'Veggie Burger',
                number: quantities[index],
                onAdd: () => onAdd(index),
                onMin: () => onMin(index),
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        height: 90,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              offset: const Offset(0, 0),
              color: Colors.grey.shade800,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Total', size: 16),
                SizedBox(height: 4),
                CustomText(text: '\$ 18.9', size: 20, weight: FontWeight.w500),
              ],
            ),
            CustomButton(
                text: 'Checkout',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutView()));
                },
            ),
          ],
        ),
      ),
    );
  }
}
