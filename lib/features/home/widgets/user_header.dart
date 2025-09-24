import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/logo/logo.svg', color: AppColors.primary, height: 32),
            Gap(5),
            CustomText(text: 'Hello, Rich Sonic', size: 16, weight: FontWeight.w500, color: Colors.grey.shade500),
          ],
        ),

        Spacer(),

        CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.primary,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/test/kunckles.jpg'),
            ),
        ),


      ],
    );
  }
}
