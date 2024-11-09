import 'package:car_app/domain/entities/products.dart';
import 'package:flutter/material.dart';

class CustomHorizontalList extends StatelessWidget {
  final List<Product> products;

  const CustomHorizontalList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, 
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          width: 150,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(product.name,),
              Text('\$${product.price}',),
            ],
          ),
        );
      },
    );
  }
}
