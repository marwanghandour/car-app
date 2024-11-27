import '../entities/car_entity.dart';
import '../repositories/product_repo.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  // Fetch products by make
  Future<List<CarEntity>> call() async {
    return await repository.getAllProducts();
    
  }
}
