import 'package:car_app/core/errors/exceptions.dart';
import 'package:car_app/core/utils/network_info.dart';
import 'package:car_app/data/models/car_model.dart';
import 'package:car_app/domain/entities/car_entity.dart';
import 'package:dio/dio.dart';
import '../../domain/repositories/product_repo.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio dio;
  final NetworkInfo networkInfo;

  final String apikey = 'ZrQEPSkKbWFyd2FubWFybW9yYTIwMDZAZ21haWwuY29t';

  ProductRepositoryImpl({
    required this.dio,
    required this.networkInfo,
  });

  @override
  Future<List<CarEntity>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dio.get(
          'https://auto.dev/api/listings?apikey=$apikey&make=Toyota&exterior_color[]=red&interior_color[]=blue&page=1',
        );
        if (response.statusCode == 200) {
          List<CarEntity> products = (response.data['records'] as List)
              .map((productJson) => CarModel.fromJson(productJson).toEntity())
              .toList();
          return products;
        } else {
          throw ServerException();
        }
      } catch (e) {
        if (e is DioException) {
          if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
            throw TimeoutException(); 
          }
        }
        throw ServerException(); 
      }
    } else {
      throw CacheException(); 
    }
  }

  @override
  Future<List<CarEntity>> getTeslaProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dio.get(
          'https://auto.dev/api/listings?apikey=$apikey&sort_filter=created_at:asc&make=Tesla&model=Model%203&radius=50&condition[]=used&page=1',
        );
        if (response.statusCode == 200) {
          List<CarEntity> products = (response.data['records'] as List)
              .map((productJson) => CarModel.fromJson(productJson).toEntity())
              .toList();
          return products;
        } else {
          throw ServerException();
        }
      } catch (e) {
        if (e is DioException) {
          if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
            throw TimeoutException(); 
          }
        }
        throw ServerException(); 
      }
    } else {
      throw CacheException();
    }
  }
}
