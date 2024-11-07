import 'package:dio/dio.dart';
import '../../core/errors/exceptions.dart';
import '../../core/utils/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repo.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio dio;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.dio,
    required this.networkInfo,
  });

  @override
Future<List<ProductEntity>> getAllProducts() async {
  if (await networkInfo.isConnected) {
    try {
      final response = await dio.get('https://api.escuelajs.co/api/v1/products');
      if (response.statusCode == 200) {
        List<ProductEntity> products = (response.data as List)
            .map((productJson) => ProductModel.fromJson(productJson).toEntity())
            .toList();
        return products;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  } else {
    throw CacheException();
  }
}

@override
Future<ProductEntity> getProductById(String id) async {
  if (await networkInfo.isConnected) {
    try {
      final response = await dio.get('https://api.escuelajs.co/api/v1/categories/$id/products');
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data).toEntity();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  } else {
    throw CacheException();
  }
}
}