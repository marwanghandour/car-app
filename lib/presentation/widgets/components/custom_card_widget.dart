import 'package:car_app/domain/entities/car_entity.dart';
import 'package:car_app/presentation/views/product/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'custom_image.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key, required this.product});
  final CarEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
         MaterialPageRoute(builder:(context) {
           return ProductDetailView(product: product);
         },)
         );
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: CustomImage(
                imageUrl: product.primaryPhotoUrl
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.make,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('${product.mileage} | ${product.condition}'),
                  const SizedBox(height: 4),
                  Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
