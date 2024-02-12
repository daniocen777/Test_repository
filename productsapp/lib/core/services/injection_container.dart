import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../src/products/data/datasources/product_datasource.dart';
import '../../src/products/data/repositories/product_repository_impl.dart';
import '../../src/products/domain/repositories/product_repository.dart';
import '../../src/products/domain/usecases/create_product.dart';
import '../../src/products/domain/usecases/delete_product.dart';
import '../../src/products/domain/usecases/get_products.dart';
import '../../src/products/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // Blocs
    ..registerFactory(() => ProductBloc(
        getProducts: sl(), deleteProduct: sl(), createProduct: sl()))
    // Usecases
    ..registerLazySingleton(() => GetProducts(sl()))
    ..registerLazySingleton(() => DeleteProduct(sl()))
    ..registerLazySingleton(() => CreateProduct(sl()))
    // Repositories
    ..registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(sl()))
    // Datasources
    ..registerLazySingleton<ProductDataSource>(
        () => ProductDataSourceImpl(sl()))
    // // External
    ..registerLazySingleton(() => http.Client());
}
