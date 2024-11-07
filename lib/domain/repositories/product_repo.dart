import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getAllProducts();
  Future<ProductEntity> getProductById(String id);
}
