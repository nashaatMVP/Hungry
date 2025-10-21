import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:huungry/core/constants/app_colors.dart';

Widget glassContainer({required Widget child}) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.bottomLeft,
    children: [

      Positioned.fill(
        child: IgnorePointer(
          child: Opacity(
            opacity: 0.9,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white.withOpacity(0.1),
                child: Lottie.asset(
                  'assets/lottie/burger.json',
                  fit: BoxFit.cover,
                  repeat: true,
                ),
              ),
            ),
          ),
        ),
      ),

      // --- Frosted Glass Layer ---
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary.withOpacity(0.8),
              AppColors.primary.withOpacity(0.9),
              AppColors.primary.withOpacity(0.1),
            ],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 80,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: child,
          ),
        ),
      ),
    ],
  );
}
