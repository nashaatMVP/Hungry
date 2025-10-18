import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:huungry/shared/custom_button.dart';
import '../../../shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, scrolledUnderElevation: 0,backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 120, top: 10),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: -5,
                              right: 0,
                              left: 0,
                              child: Image.asset('assets/icon/shadow.png'),
                            ),
                            Center(
                              child:
                              Image.asset(
                                'assets/test/test.png',
                                width: 90,
                                height: 90,
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: 'Hamburger Hamburger',
                                  weight: FontWeight.bold,
                                  size: 14,
                              ),
                              CustomText(text: 'Qty : X3', size: 14,),
                              CustomText(text: 'Price : 20\$', size: 14),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    CustomButton(
                        height: 45,
                        text: 'Order Again' ,
                        color: Colors.grey.shade400,
                        width: double.infinity,
                    ),
                  ],
                ),
              ),

            );
          },
        ),
      ),
    );
  }
}
