part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {
  const ProductInitialState();
}

class GettingProductState extends ProductState {
  const GettingProductState();
}

class ProductLoadedState extends ProductState {
  const ProductLoadedState(this.products);

  final List<ProductEntity> products;

  @override
  List<Object> get props => products.map((product) => product.id).toList();
}

class GettingProductByIdState extends ProductState {
  const GettingProductByIdState();
}

class GettedProductByIdState extends ProductState {
  const GettedProductByIdState(this.product);

  final ProductEntity product;

  @override
  List<Object> get props => [product.id];
}

class DeletingState extends ProductState {
  const DeletingState();
}

class DeletedState extends ProductState {
  const DeletedState();
}

class ProductErrorState extends ProductState {
  const ProductErrorState(this.message);
  final String message;

  @override
  List<String> get props => [message];
}

class CreatingProductState extends ProductState {
  const CreatingProductState();
}

class CreatedProductState extends ProductState {
  const CreatedProductState();
}
