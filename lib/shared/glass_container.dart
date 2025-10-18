import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:huungry/core/constants/app_colors.dart';

Widget glassContainer({required Widget child}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: BackdropFilter(
      enabled: true,
      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.primary,
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.9),
              AppColors.primary,
              AppColors.primary,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.2,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        child: child,
      ),
    ),
  );
}
