import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/product_enntity.dart';
import '../repositories/product_repository.dart';

class DeleteProduct extends UsecaseWithParams<ProductEntity, int> {
  DeleteProduct(this._repository);

  final ProductRepository _repository;

  @override
  ResultFuture<ProductEntity> call(int params) async =>
      await _repository.delete(params);
}
