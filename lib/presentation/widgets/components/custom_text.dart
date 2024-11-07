import 'package:car_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final VoidCallback onPressed; 
  final String text;
  final String buttontext;

  const CustomText({super.key, required this.onPressed, required this.text, required this.buttontext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black, 
          ),
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: buttontext,
              style: const TextStyle(
                color: AppColors.primaryLight,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
