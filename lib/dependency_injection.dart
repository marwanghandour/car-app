import 'package:car_app/presentation/blocs/product_bloc/tesla/bloc/tesla_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'core/utils/network_info.dart';
import 'data/repostories/product_repo_impl.dart';
import 'domain/repositories/product_repo.dart';
import 'domain/usecases/get_product.dart';
import 'presentation/blocs/product_bloc/product_bloc.dart';

final sl = GetIt.instance;

void setup() {
  // External dependencies
  sl.registerLazySingleton(() => Dio());

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl<Dio>()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      dio: sl<Dio>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetProducts(sl<ProductRepository>()));

  // Blocs
  sl.registerFactory(() => ProductBloc(sl<GetProducts>()));
  sl.registerFactory(() => Tesla(sl<GetProducts>()));
}
