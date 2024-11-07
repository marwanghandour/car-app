import '../entities/product.dart';
import '../repositories/product_repo.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.getAllProducts();
  }


  Future<ProductEntity> call2() async {
    return await repository.getProductById('2');
  }
  
}
