import 'package:car_app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import '../components/custom_card_widget.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductModel> products;

  const ProductGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.65, 
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final product = products[index];
          return CustomCardWidget(product: product);
        },
        childCount: products.length,
      ),
    );
  }
}