import 'package:car_app/presentation/widgets/components/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';

class ProductDetailButtons extends StatelessWidget {
  const ProductDetailButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CustomButton
             (
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20)
              ),
              color: Colors.blue.shade100,
              text: 'Book a visit',
              textcolor: AppColors.primaryLight,
               onPressed: (){}),
               CustomButton
             (
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15           ),
                borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
              color: AppColors.primaryLight,
              text: 'Make your deal',
              textcolor: Colors.white,
               onPressed: (){}),
           ],
         ),
       );
  }
}