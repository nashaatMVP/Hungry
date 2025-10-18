import 'package:flutter/material.dart';
import 'package:huungry/core/constants/app_colors.dart';

class CustomUserTxtField extends StatelessWidget {
  const CustomUserTxtField({
    super.key,
    required this.controller,
    required this.label,
    this.textInputType,
  });
  final TextEditingController controller;
  final String label;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 20,
      controller: controller,
      keyboardType: textInputType,
      cursorColor: AppColors.primary,
      style: TextStyle(color: AppColors.primary, fontSize: 14),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        labelText: label,
        labelStyle: TextStyle(color: AppColors.primary),
        hintStyle: TextStyle(color: AppColors.primary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
