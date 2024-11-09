import 'package:car_app/core/utils/contants.dart';
import 'package:car_app/domain/entities/categories_row_entity.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 150,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: categories.map((category) {
          return _buildCategoryItem(context, category);
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, CategoryRowEntity category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.imageUrl, height: 80, fit: BoxFit.contain),
            
            AppConstants.verticalSpacingSmall,
            
            Text(
              category.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}