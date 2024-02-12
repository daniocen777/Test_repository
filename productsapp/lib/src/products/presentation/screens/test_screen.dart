import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/product_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, required this.id});

  static const routeName = 'product-item';

  final String id;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is GettingProductByIdState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductErrorState) {
            return Center(
              child: Text(state.message, style: const TextStyle(fontSize: 20)),
            );
          }
          if (state is GettedProductByIdState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    'Single Produdt => ${state.product.name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () => context.push('/'),
                      child: const Text('Regresar'))
                ],
              ),
            );
          }

          return Center(
            child: Text('ESTADO => $state'),
          );
        },
      ),
    );
  }
}
