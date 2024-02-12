import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_enntity.dart';
import '../../domain/usecases/create_product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(
      {required GetProducts getProducts,
      required DeleteProduct deleteProduct,
      required CreateProduct createProduct})
      : _getProducts = getProducts,
        _deleteProduct = deleteProduct,
        _createProduct = createProduct,
        super(const ProductInitialState()) {
    on<GetProductsEvent>(_getProductsHanlder);
    on<DeleteEvent>(_deleteProductHanlder);
    on<CreateProductEvent>(_createProductHandler);
  }

  // Caasos de uso
  final GetProducts _getProducts;
  final DeleteProduct _deleteProduct;
  final CreateProduct _createProduct;

  Future<void> _getProductsHanlder(
      GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(const GettingProductState());
    final result = await _getProducts();
    result.fold((failure) => emit(ProductErrorState(failure.errorMessage)),
        (products) => emit(ProductLoadedState(products)));
  }

  Future<void> _deleteProductHanlder(
      DeleteEvent event, Emitter<ProductState> emit) async {
    emit(const DeletingState());
    final result = await _deleteProduct(event.id);
    result.fold((failure) => emit(ProductErrorState(failure.errorMessage)),
        (product) => emit(const DeletedState()));
  }

  Future<void> _createProductHandler(
      CreateProductEvent event, Emitter<ProductState> emit) async {
    emit(const CreatingProductState());
    final result = await _createProduct(CreateProductParams(
        name: event.name, price: event.price, description: event.description));
    result.fold((failure) => emit(ProductErrorState(failure.errorMessage)),
        (_) => emit(const CreatedProductState()));
  }
}
