import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_field.dart';

class ProductFormWidget extends StatelessWidget {
  const ProductFormWidget(
      {super.key,
      required this.nameController,
      required this.priceController,
      required this.descriptionController,
      required this.formKey});

  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomField(controller: nameController, hintText: 'Name'),
          const SizedBox(height: 10),
          CustomField(
            controller: priceController,
            hintText: 'Price',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          CustomField(
              controller: descriptionController, hintText: 'Description'),
        ],
      ),
    );
  }
}
