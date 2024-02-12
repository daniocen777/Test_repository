import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../models/product_response_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();

  Future<ProductModel> delete(int id);

  Future<ProductResponse> createProduct(
      {required String name, required int price, required String description});

  //  Future<ProductModel> getProductById(int id);
}

class ProductDataSourceImpl implements ProductDataSource {
  const ProductDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      // Dirección usando emulador:
      // 10.0.2.2  (no se podrá ver info en dispositivo físco o en web)
      final response =
          await _client.get(Uri.http('10.0.2.2:3000', '/products'));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
            message: response.body, statusCode: response.statusCode.toString());
      }

      final productReponse =
          ProductResponse.fromJson(jsonDecode(response.body));

      return productReponse.obj!;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }

  @override
  Future<ProductModel> delete(int id) async {
    try {
      final response =
          await _client.delete(Uri.http('10.0.2.2:3000', '/products/$id'));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
            message: response.body, statusCode: response.statusCode.toString());
      }

      final product = ProductResponse.fromJson(jsonDecode(response.body));
      if (product.isError!) {
        throw ServerException(message: product.message!, statusCode: '404');
      }

      return product.obj![0];
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }

  @override
  Future<ProductResponse> createProduct(
      {required String name,
      required int price,
      required String description}) async {
    try {
      final response =
          await _client.post(Uri.http('10.0.2.2:3000', '/products/create'),
              body: jsonEncode(
                {'name': name, 'price': price, 'description': description},
              ),
              headers: {'Content-Type': 'application/json'});

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
            message: response.body, statusCode: response.statusCode.toString());
      }

      final productResponse =
          ProductResponse.fromJson(jsonDecode(response.body));

      if (productResponse.isError!) {
        throw ServerException(
            message: productResponse.message!, statusCode: '404');
      }

      return productResponse;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }
}
