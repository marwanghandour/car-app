import 'package:car_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/utils/contants.dart';
import '../components/custom_button.dart';
import '../components/custom_text.dart';

class GetStartedWidgets extends StatelessWidget {
  const GetStartedWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
        children:[
          SizedBox(
            height: size.height * 0.4,
            child: Image.asset('assets/images/2018-Tesla-Model-3-5.jpg', fit: BoxFit.cover)),
       
       AppConstants.verticalSpacingMedium,
       
        const Text("Let's Get Started", 
        style: TextStyle(
         fontSize: 28,
          fontWeight: FontWeight.bold,
          ),),
        AppConstants.verticalSpacingSmall,

         const Text('Sign up or Log in to find out the best car for you'),
       
       AppConstants.verticalSpacingLarge,
       
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CustomButton(
            color: Colors.white10,
            textcolor: Colors.black,
            icon: const Icon(AppIcons.email, color: Colors.black,),
            text: 'Continue With Mail',
            borderRadius: AppConstants.cardBorderRadius,
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 70.0),
           
             onPressed: () { 
              Navigator.pushReplacementNamed(context,
               AppRoutes.main,
               );
           
              },
             ),
         ],
       ),

        AppConstants.verticalSpacingLarge,

         CustomButton(
          color: Colors.white10,
            textcolor: Colors.black,
        text: 'Continue With Google',
        borderRadius: AppConstants.cardBorderRadius,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
          icon: const Icon(AppIcons.google, color: Colors.black,),

         onPressed: () { 
          Navigator.pushReplacementNamed(context,
               AppRoutes.main,
               );

          },
         ),
        AppConstants.verticalSpacingLarge,

         CustomButton(
          color: Colors.white10,
            textcolor: Colors.black,
        text: 'Continue With Apple',
                icon: const Icon(AppIcons.apple, color: Colors.black,),

        borderRadius: AppConstants.cardBorderRadius,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 67.0),
         onPressed: () { 
          Navigator.pushReplacementNamed(context,
               AppRoutes.main,
               );

          },
         ),
         AppConstants.verticalSpacingLarge,

        CustomText(
          text: 'Already have an account? ', 
          buttontext: 'Sign In',
          onPressed: () {
        }, 
        ),
        ],
      );
  }
}