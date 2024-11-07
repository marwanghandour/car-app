import 'package:flutter/material.dart';
import '../../../domain/entities/product.dart';
import '../components/custom_image.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        width: 600,
                        child: Row(
                          children: [
                            CustomImage(imageUrl: product.images.first, height: 100,),
                            Text(product.title),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
  }
}