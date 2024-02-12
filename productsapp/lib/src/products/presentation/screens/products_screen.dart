import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/product_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  static const routeName = 'products-screen';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() {
    context.read<ProductBloc>().add(const GetProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/home/add'),
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is DeletedState || state is CreatedProductState) {
            getProducts();
          }
        },
        builder: (_, state) {
          if (state is GettingProductState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is ProductLoadedState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (_, int index) {
                final product = state.products[index];
                return Dismissible(
                  key: ValueKey<int>(product.id),
                  background: Container(
                    color: Colors.redAccent,
                    child: const Icon(
                      Icons.delete_forever,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    context.read<ProductBloc>().add(DeleteEvent(product.id));
                  },
                  child: ListTile(
                    leading: Text(product.id.toString()),
                    trailing: const Icon(Icons.navigate_next_outlined),
                    title: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    subtitle: Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text('Error inesperado'),
          );
        },
      ),
    );
  }
}
