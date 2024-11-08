import 'package:car_app/core/utils/app_colors.dart';
import 'package:car_app/core/utils/app_routes.dart';
import 'package:car_app/core/utils/contants.dart';
import 'package:car_app/presentation/widgets/components/custom_button.dart';
import 'package:car_app/presentation/widgets/components/custom_onboarding_image.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const CustomOnboardingImage(),
            
            const Center(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppConstants.verticalSpacingLarge,
                    Text(
                      'Find Your Perfect Car',
                      style: TextStyle(
                        fontSize: AppConstants.titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, 
                        
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Get ready to explore the best car deals.',
                      style: TextStyle(
                        fontSize: AppConstants.subtitleFontSize,
                        color: Colors.white, 
                        
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                  ],
                ),
              ),
            ),
          Positioned(
            top: size.height * 0.8,
            left: size.width * 0.05,
            child: Column(
              children: [
                CustomButton(
                  borderRadius: AppConstants.cardBorderRadius,
                  color: AppColors.primaryLight,
                                  text: 'Get Started',
                                  textcolor: Colors.white,
                                   onPressed: (){
                                    Navigator.pushReplacementNamed(
                                      context,
                                     AppRoutes.getstarted,
                                      );
                                   },
                                   padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 130
                                   ), 
                                   
                                   ),
                                   const SizedBox(height: 15,),
                                   CustomButton(
                                    
                                    borderRadius: AppConstants.cardBorderRadius,
                                    textcolor: Colors.black,
                              text: 'Login',
                               onPressed: (){
                                Navigator.pushReplacementNamed(
                                  context,
                                 AppRoutes.login,
                                  );
                               },
                               padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 155
                               ), 
                               
                               ),
              ],
            ),
          ),
      
          
      
        ],
      ),

    );
  }
}