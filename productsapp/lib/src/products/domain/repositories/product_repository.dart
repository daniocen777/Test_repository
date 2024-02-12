import '../../../../core/utils/typedef.dart';
import '../entities/product_enntity.dart';

abstract class ProductRepository {
  const ProductRepository();

  ResultFuture<List<ProductEntity>> getProducts();

  ResultFuture<ProductEntity> delete(int id);

  ResultVoid createProduct(
      {required String name, required int price, required String description});
}
