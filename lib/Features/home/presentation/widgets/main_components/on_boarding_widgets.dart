import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../components/custom_button.dart';

class OnBoardingWidgets extends StatelessWidget {
  const OnBoardingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;
    return Column(
      children: [
         Positioned(
            top: size.height * 0.06,
            left: 25.0,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Find Your Perfect Car',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                    
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Get ready to explore the best car deals.',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, 
                    
                  ),
                  textAlign: TextAlign.center,
                ),
                
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.8,
            left: size.width * 0.05,
            child: Column(
              children: [
                CustomButton(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryLight,
                                  text: 'Get Started',
                                  textcolor: Colors.white,
                                   onPressed: (){
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                     AppRoutes.main,
                                      (Route<dynamic> route) => false,
                                      );
                                   },
                                   padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 130
                                   ), 
                                   
                                   ),
                                   const SizedBox(height: 15,),
                                   CustomButton(
                                    borderRadius: BorderRadius.circular(10),
                                    textcolor: Colors.black,
                              text: 'Login',
                               onPressed: (){
                                Navigator.pushReplacementNamed(context,
                                 AppRoutes.login
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
    );


  }
}
  