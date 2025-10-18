import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.text,
    required this.desc,
    required this.rate,
  });
  final String image , text , desc , rate;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:  BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 500),
        child: Container(
        decoration: BoxDecoration(
          // color: Colors.purple.withAlpha(450).withOpacity(0.3),
          gradient:  LinearGradient(colors: [
            AppColors.primary,
            AppColors.primary,
            AppColors.primary.withOpacity(0.9),
            AppColors.primary.withOpacity(0.9),
            AppColors.primary.withOpacity(0.9),
            AppColors.primary,
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -10,
                    right: 10,
                    left: 10,
                    child: Image.asset('assets/icon/shadow.png', color: Colors.black26),
                  ),
                  Center(child: Image.asset(image, width: 100, height: 100),
                  ),
                ],
              ),
              Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: text, weight: FontWeight.bold, size: 13,color: Colors.white),
                    CustomText(text: desc, size: 14,color: Colors.white),
                    Gap(10),
                    Row(
                      children: [
                        Icon(CupertinoIcons.star_fill, size: 16,color: Colors.white),
                        Gap(6),
                        CustomText(text: rate, size: 15, weight: FontWeight.bold, color: Colors.white),
                        Spacer(),
                        Icon(CupertinoIcons.heart , color: Colors.white, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

