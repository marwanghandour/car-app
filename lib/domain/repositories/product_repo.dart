import 'package:car_app/domain/entities/car_entity.dart';
import 'package:dio/dio.dart';

abstract class ProductRepository {
  ProductRepository(Dio dio);

  Future<List<CarEntity>> getAllProducts();
  Future<List<CarEntity>> getTeslaProducts();
}
