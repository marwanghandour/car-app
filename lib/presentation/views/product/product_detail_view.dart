import 'package:car_app/core/utils/app_icons.dart';
import 'package:car_app/domain/entities/car_entity.dart';
import 'package:car_app/presentation/widgets/components/icon_container.dart';
import 'package:car_app/presentation/widgets/main_components/product_detail_widgets.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});
  final CarEntity product;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconContainer(
              icon: const Icon(AppIcons.favorite),
              onPressed: () {
              },
            ),
          ),
        ],
        title: const SafeArea(child: Text('Car Detail')),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconContainer(
            icon: const Icon(AppIcons.xsign),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: ProductDetailWidgets(product: product),
    );
  }
}
