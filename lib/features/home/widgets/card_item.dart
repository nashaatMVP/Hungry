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
  final String image, text, desc, rate;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 500),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade100,
                Colors.grey.shade300,
                Colors.grey.shade400,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Image.asset(
                        'assets/icon/shadow.png',
                        color: Colors.black26,
                      ),
                    ),
                    Center(
                      child: Image.network(image, width: 130, height: 135),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: text,
                        weight: FontWeight.bold,
                        size: 13,
                        color: AppColors.primary,
                      ),
                      CustomText(text: desc, size: 10, color: Colors.black54),
                      Gap(10),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: Colors.yellow.shade500,
                          ),
                          Gap(6),
                          CustomText(
                            text: rate,
                            size: 15,
                            weight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                          Spacer(),
                          Icon(
                            CupertinoIcons.heart,
                            color: AppColors.primary,
                            size: 20,
                          ),
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
