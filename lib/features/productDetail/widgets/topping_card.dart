import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/shared/custom_text.dart';

class ToppingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;
  final Color color;

  const ToppingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAdd,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: color,
              padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 10),
              child: Column(
                children: [
                  Image.network(imageUrl, fit: BoxFit.contain , width: 80, height:  50),

                  Gap(10),

                  CustomText(
                    text: title,
                    color: Colors.black,
                    size: 14,
                    weight: FontWeight.w600,
                  ),

                  Gap(5),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
