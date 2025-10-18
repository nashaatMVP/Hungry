import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/features/checkout/widgets/order_details_widget.dart';
import 'package:huungry/shared/custom_text.dart';

import '../../../shared/custom_button.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Order summary', size: 20, weight: FontWeight.w500),
              Gap(10),
              OrderDetailsWidget(
                  order: '18,5',
                  taxes: '3.50',
                  fees: '40.33',
                  total: '100.00',
              ),
              Gap(80),
              CustomText(text: 'Payment methods', size: 20, weight: FontWeight.w500),
              Gap(15),
              /// Cash
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                tileColor: Color(0xff3C2F2F),
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                leading: Image.asset('assets/icon/cash.png', width: 50),
                title: CustomText(text: 'Cash on Delivery',color: Colors.white),
                trailing: Radio<String>(
                    activeColor: Colors.white,
                    value: 'Cash',
                    groupValue: selectedMethod,
                    onChanged: (v) => setState(() => selectedMethod = v!),
                ),
                onTap: () => setState(() => selectedMethod = 'Cash'),
              ),
              Gap(10),
              /// Debit
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                tileColor: Colors.blue.shade900,
                contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                leading: Icon(CupertinoIcons.creditcard, color: Colors.white),
                title: CustomText(text: 'Debit card',color: Colors.white),
                subtitle: CustomText(text: '**** ***** 2342',color: Colors.white),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: 'Visa',
                  groupValue: selectedMethod,
                  onChanged: (v) => setState(() => selectedMethod = v!),
                ),
                onTap: () => setState(() => selectedMethod = 'Visa'),
              ),
              Gap(5),
              Row(
                children: [
                  Checkbox(
                      activeColor: Color(0xffEF2A39),
                      value: true,
                      onChanged: (v) {},
                  ),
                  CustomText(text: 'Save card details for future payments'),
                ],
              ),
              Gap(200),
            ],
          ),
        ),
      ),


      bottomSheet: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Total', size: 15),
                  CustomText(text: '\$ 18.9', size: 24),
                ],
              ),

              CustomButton(text: 'Pay Now', onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade800,
                                  blurRadius: 15,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: AppColors.primary,
                                  child: Icon(CupertinoIcons.check_mark , color: Colors.white,size: 30,),


                                ),
                                Gap(10),
                                CustomText(
                                  text: 'Success!',
                                  weight: FontWeight.bold,
                                  color: AppColors.primary,
                                  size: 20,
                                ),
                                Gap(3),
                                CustomText(
                                    text: 'Your payment was successful. \nA receipt for this purchase \nhas been sent to your email.',
                                    color: Colors.grey.shade400,
                                    size: 11,
                                ),

                                Gap(10),
                                CustomButton(text: 'Close' , width: 200 , onTap: () {
                                  Navigator.pop(context);
                                },),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
              }),
            ],
          ),
        ),
      ),



    );
  }
}





