import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({super.key, this.onTap, required this.text, this.color, this.textColor});
  final Function() ? onTap;
  final String text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: color ??  Colors.white,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: Colors.grey,
            ),
        ),
        width: double.infinity,
        child: Center(child: CustomText(
          text: text,
          size: 15,
          weight: FontWeight.w600,
          color: textColor ??  AppColors.primary,
        )),
      ),
    );
  }
}
