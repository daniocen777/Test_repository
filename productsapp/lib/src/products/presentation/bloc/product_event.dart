part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductEvent {
  const GetProductsEvent();
}

class DeleteEvent extends ProductEvent {
  const DeleteEvent(this.id);

  final int id;

  @override
  List<int> get props => [id];
}

class CreateProductEvent extends ProductEvent {
  const CreateProductEvent(
      {required this.name, required this.price, required this.description});

  final String name;
  final int price;
  final String description;

  @override
  List<Object> get props => [name, price, description];
}
