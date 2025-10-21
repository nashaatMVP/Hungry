import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({super.key, this.onTap, required this.text, this.color, this.textColor, this.isIcon});
  final Function() ? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: color ??  Colors.transparent,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: Colors.white60.withOpacity(0.5),
            ),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: CustomText(
              text: text,
              size: 14,
              weight: FontWeight.w400,
              color: textColor ??  AppColors.primary,
            )),
            if(isIcon == true)
            Gap(5),
            if(isIcon == true)
            Icon(CupertinoIcons.person, color: Colors.grey.shade100,size: 16),
          ],
        ),
      ),
    );
  }
}
