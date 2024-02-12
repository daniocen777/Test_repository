import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity(
      {required this.id,
      required this.name,
      required this.price,
      required this.description});

  final int id;
  final String name;
  final int price;
  final String description;

  @override
  List<Object?> get props => [id, name];
}
