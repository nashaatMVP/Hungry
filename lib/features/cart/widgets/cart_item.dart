import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.image,
    required this.text,
    required this.desc,
    this.onAdd,
    this.onMin,
    this.onRemove,
    required this.number,
  });
  final String image , text , desc;
  final Function() ? onAdd;
  final Function() ? onMin;
  final Function() ? onRemove;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, width: 80),
              CustomText(text: text,weight: FontWeight.bold, size: 14,),
              CustomText(text: desc, size: 13,),
            ],
          ),

          Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: onAdd,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.primary,
                      child: Icon(CupertinoIcons.add, color: Colors.white, size: 15),
                    ),
                  ),
                  Gap(20),
                  CustomText(text: number.toString() ,weight: FontWeight.w400,size: 20),
                  Gap(20),
                  GestureDetector(
                    onTap: onMin,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.primary,
                      child: Icon(CupertinoIcons.minus, color: Colors.white, size: 15,),
                    ),
                  ),
                ],
              ),
              Gap(20),
              GestureDetector(
                onTap: onRemove,
                child: Container(
                  height: 40,
                  width:  130,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: CustomText(text: 'Remove',color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
