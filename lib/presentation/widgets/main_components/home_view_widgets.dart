import 'package:car_app/dependency_injection.dart';
import 'package:car_app/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:car_app/presentation/blocs/product_bloc/product_state.dart';
import 'package:car_app/presentation/widgets/components/category_row.dart';
import 'package:car_app/presentation/widgets/components/category_title.dart';
import 'package:car_app/presentation/widgets/components/custom_horizontal_list.dart';
import 'package:car_app/presentation/widgets/elements/custom_circle_indicator.dart';
import 'package:car_app/presentation/widgets/elements/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/product_bloc/product_event.dart';
import '../../views/errors/error_view.dart';
import '../components/discount_card.dart';

class HomeViewWidgets extends StatelessWidget {
  const HomeViewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        _buildCard(),
        _categoryTitle(),
        _buildCategoryList(),
        _buildFeaturedProductsTitle(),
        _buildToyotaProducts(),
      ],
    );
  }

  SliverToBoxAdapter _buildCard() {
    return const SliverToBoxAdapter(
      child: DiscountCard(),
    );
  }

  SliverToBoxAdapter _categoryTitle() {
    return const SliverToBoxAdapter(
      child: CategoryTitle(title: 'Top Brands'),
    );
  }

  SliverToBoxAdapter _buildCategoryList() {
    return const SliverToBoxAdapter(
      child: CategoryRow(),
    );
  }

  SliverToBoxAdapter _buildFeaturedProductsTitle() {
    return const SliverToBoxAdapter(
      child: CategoryTitle(title: 'Featured Selections'),
    );
  }

  SliverToBoxAdapter _buildToyotaProducts() {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) => ProductBloc(sl())..add(FetchProducts()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const CustomCircleIndicator();
            } else if (state is ProductError) {
              return CustomErrorWidget(errMessege: state.message,);
            } else if (state is ProductLoaded) {
              if (state.products.isEmpty) {
                return const CustomErrorWidget(errMessege: 'No products available',);
              }
              return SizedBox(
                height: 250,
                child: CustomHorizontalList(
                  products: state.products, 
                ),
              );
            } else {
              return const ErrorView();
            }
          },
        ),
      ),
    );
  }


}
