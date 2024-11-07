import '../../../domain/entities/product.dart';

abstract class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}