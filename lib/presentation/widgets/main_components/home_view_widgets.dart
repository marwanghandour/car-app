import 'package:car_app/presentation/widgets/components/category_row.dart';
import 'package:car_app/presentation/widgets/components/category_title.dart';
import 'package:car_app/presentation/widgets/components/custom_horizontal_list.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/products.dart';
import '../components/discount_card.dart';

class HomeViewWidgets extends StatelessWidget {
  const HomeViewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> featuredProducts = _getFeaturedProducts();

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        _buildCard(),
        _categoryTitle(),
        _buildCategoryList(),
        _buildFeaturedProductsTitle(),
        _buildFeaturedProducts(featuredProducts),
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

  SliverToBoxAdapter _buildFeaturedProducts(List<Product> featuredProducts) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200, 
        child: CustomHorizontalList(products: featuredProducts),
      ),
    );
  }

  List<Product> _getFeaturedProducts() {
    return [
      Product(id: 1, name: "Product 1", price: 29.99),
      Product(id: 2, name: "Product 2", price: 49.99),
      Product(id: 3, name: "Product 3", price: 99.99),
      Product(id: 4, name: "Product 4", price: 199.99),
    ];
  }
}
