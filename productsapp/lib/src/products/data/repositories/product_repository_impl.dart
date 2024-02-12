import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/product_enntity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_datasource.dart';
import '../mappers/product_mapper.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._dataSource);

  final ProductDataSource _dataSource;

  @override
  ResultFuture<List<ProductEntity>> getProducts() async {
    try {
      final result = await _dataSource.getProducts();
      final productsList =
          (result.map((model) => ProductMapper.modelToEntity(model))).toList();
      if (productsList.isNotEmpty) {
        return Right(productsList);
      }

      return Left(
          ServerFailure(message: 'La lista está vacia', statusCode: '404'));
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<ProductEntity> delete(int id) async {
    try {
      final result = await _dataSource.delete(id);
      final product = ProductMapper.modelToEntity(result);
      return Right(product);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid createProduct(
      {required String name,
      required int price,
      required String description}) async {
    try {
      await _dataSource.createProduct(
          name: name, price: price, description: description);

      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
