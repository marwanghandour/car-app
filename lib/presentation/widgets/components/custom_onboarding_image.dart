import 'package:flutter/material.dart';

import '../../../core/utils/app_strings.dart';

class CustomOnboardingImage extends StatelessWidget {
  const CustomOnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;
    return Image.asset(
              AppStrings.onboarding,
              fit: BoxFit.cover, 
              width: size.width, 
              height: size.height, 
            );
  }
}