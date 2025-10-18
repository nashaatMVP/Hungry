import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class FoodCategory extends StatefulWidget {
  FoodCategory({super.key, required this.selectedIndex, required this.category});
  final int selectedIndex;
  final List category;

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.category.length, (index) {
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                color: selectedIndex == index
                    ? AppColors.primary
                    : Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
              child: CustomText(
                size: 14,
                text: widget.category[index],
                weight: FontWeight.w500,
                color: selectedIndex == index ? Colors.white : Colors.grey.shade700,
              ),
            ),
          );
        }),
      ),
    );
  }
}
