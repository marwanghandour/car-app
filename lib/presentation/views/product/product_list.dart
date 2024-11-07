import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/product_bloc/product_bloc.dart';
import '../../blocs/product_bloc/product_state.dart';
import '../../widgets/elements/custom_circle_indicator.dart';
import '../../widgets/elements/error_widget.dart';
import '../../widgets/main_components/product_list_widget.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const CustomCircleIndicator();
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductListWidget(product: product);
              },
            );
          } else if (state is ProductError) {
            return CustomErrorWidget(errMessege: state.message);
          } else {
            return const CustomErrorWidget(errMessege: 'No Products');
          }
        },
      );
  }
}