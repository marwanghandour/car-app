import 'package:car_app/core/utils/app_colors.dart';
import 'package:car_app/core/utils/contants.dart';
import 'package:flutter/material.dart';

class HomeViewWidgets extends StatelessWidget {
  const HomeViewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(
      slivers: [
        _buildContent(context),
        
      ],
      
    );
  }
  SliverToBoxAdapter _buildContent(context) {
    var size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppConstants.cardPadding,
        child: Container(
          height: size.height * 0.26,
          width: size.width,
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
      ),
    );
  }
}
