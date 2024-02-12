import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_rounded_button.dart';
import '../bloc/product_bloc.dart';
import '../widgets/product_form_widget.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  static const routeName = 'products-add';

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void clearData() {
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const Text(
                'Please, complete data',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              ProductFormWidget(
                  nameController: nameController,
                  priceController: priceController,
                  descriptionController: descriptionController,
                  formKey: formKey),
              const SizedBox(height: 30),
              CustomRoundedButton(
                  label: 'Add Product',
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (formKey.currentState!.validate()) {
                      context.read<ProductBloc>().add(CreateProductEvent(
                          name: nameController.text.trim(),
                          price: int.parse(priceController.text.trim()),
                          description: descriptionController.text.trim()));
                      clearData();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
