import '../../domain/entities/product_enntity.dart';
import '../models/product_response_model.dart';

class ProductMapper {
  static ProductEntity modelToEntity(ProductModel model) => ProductEntity(
      id: model.id!,
      name: model.name!,
      price: model.price!,
      description: model.description!);
}
