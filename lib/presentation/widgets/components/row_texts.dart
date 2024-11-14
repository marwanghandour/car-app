import 'package:car_app/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';

class RowTexts extends StatelessWidget {
  const RowTexts({super.key, required this.product});
  final CarEntity product;

  Widget buildColumn(String value, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildColumn('${product.year}', 'Year'),
        buildColumn(product.price, 'Price'),
        buildColumn(product.mileage, 'Mileage'),
      ],
    );
  }
}
