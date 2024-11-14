import 'package:car_app/domain/entities/car_entity.dart';
import 'package:car_app/presentation/widgets/components/custom_card_widget.dart';
import 'package:flutter/material.dart';

class CustomHorizontalList extends StatelessWidget {
  final List<CarEntity> products;

  const CustomHorizontalList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal, 
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          width: 200,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: CustomCardWidget(product: product),
        );
      },
    );
  }
}
