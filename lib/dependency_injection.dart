import 'package:car_app/Features/home/presentation/blocs/product_bloc/tesla/bloc/tesla_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'core/utils/network_info.dart';
import 'Features/home/data/repostories/product_repo_impl.dart';
import 'Features/home/domain/repositories/product_repo.dart';
import 'Features/home/domain/usecases/get_product.dart';
import 'Features/home/presentation/blocs/product_bloc/product_bloc.dart';

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
