import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/product_repository.dart';

class CreateProduct extends UsecaseWithParams<void, CreateProductParams> {
  const CreateProduct(this._repository);

  final ProductRepository _repository;

  @override
  ResultFuture<void> call(CreateProductParams params) async =>
      await _repository.createProduct(
          name: params.name,
          price: params.price,
          description: params.description);
}

class CreateProductParams extends Equatable {
  const CreateProductParams(
      {required this.name, required this.price, required this.description});

  final String name;
  final int price;
  final String description;

  @override
  List<Object?> get props => [name, price, description];
}
