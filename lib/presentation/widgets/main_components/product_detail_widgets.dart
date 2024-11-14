import 'package:car_app/core/utils/app_colors.dart';
import 'package:car_app/domain/entities/car_entity.dart';
import 'package:car_app/presentation/widgets/components/custom_image.dart';
import 'package:car_app/presentation/widgets/navigation/tab_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/contants.dart';
import '../components/row_texts.dart';

class ProductDetailWidgets extends StatelessWidget {
  const ProductDetailWidgets({super.key, required this.product});
  final CarEntity product;

  @override
  Widget build(BuildContext context) {
 final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
            '${product.make} | ${product.model}',
            style: const TextStyle(
              fontSize: AppConstants.titleFontSize,
              fontWeight: FontWeight.bold
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              product.city,
              style: const TextStyle(
                fontSize: AppConstants.subtitleFontSize,
                fontWeight: FontWeight.bold
              ),
              ),
          ),
      
          CarouselSlider.builder(
            itemCount: product.photoUrls.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return CustomImage(
                imageUrl: product.photoUrls[index],
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                currentPageNotifier.value = index;
              },
            ),
          ),

          AppConstants.verticalSpacingMedium,

          ValueListenableBuilder<int>(
            valueListenable: currentPageNotifier,
            builder: (context, currentPage, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(10, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? AppColors.primaryLight
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              );
            },
          ),
          AppConstants.verticalSpacingMedium,
          RowTexts(product: product),
          AppConstants.verticalSpacingMedium,

          const SizedBox(
            height: 500,
            child: CustomTabBar()),
        ],
      );
  }
}