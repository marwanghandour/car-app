import 'package:flutter/material.dart';
import 'package:car_app/core/utils/app_colors.dart';
import 'package:car_app/core/utils/contants.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.cardPadding,
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: AppConstants.cardBorderRadius,
          color: AppColors.primaryLight,
        ),
        child: Padding(
          padding: AppConstants.screenPadding,
          child: Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppConstants.verticalSpacingMedium,
                  Text(
                    '25% Off',
                    style: TextStyle(
                      fontSize: AppConstants.titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  AppConstants.verticalSpacingSmall,
                  Text(
                    'Weekly Specials!',
                    style: TextStyle(
                      fontSize: AppConstants.subtitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      'Get a new cars discount valid only this week',
                      style: TextStyle(
                        fontSize: AppConstants.bodyFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              AppConstants.horizontalSpacingLarge,
              Image.asset(
                'assets/images/cardimg-removebg-preview.png',
                fit: BoxFit.cover,
                height: 200,
                width: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
