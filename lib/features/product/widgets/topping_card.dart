import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:huungry/core/constants/app_colors.dart';
import 'package:huungry/shared/custom_text.dart';

class ToppingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;

  const ToppingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 90,
            width: 90,
            color: AppColors.primary,
          ),
        ),

        // Image section
        Positioned(
          top: -40,
          right: -1,
          left: -1,
          child: SizedBox(
            height: 70,
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              child: Image.asset(imageUrl, fit: BoxFit.contain),
            ),
          ),
        ),

        // bottom widgets
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [

                CustomText(
                  text: title,
                  color: Colors.white,
                  size: 14,
                  weight: FontWeight.w600,
                ),

                Gap(5),

                GestureDetector(
                  onTap: onAdd,
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add, color: Colors.red, size: 14),
                  ),
                ),


              ],
            ),
          ),
        ),
      ],
    );
  }
}
