import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/product_enntity.dart';
import '../repositories/product_repository.dart';

class GetProducts extends UsecaseWithoutParams<List<ProductEntity>> {
  GetProducts(this._repository);

  final ProductRepository _repository;

  @override
  ResultFuture<List<ProductEntity>> call() async =>
      await _repository.getProducts();
}
