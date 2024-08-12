import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/failure.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, ProductModel>> getProductById(String id);
  Future<Either<Failure, ProductModel>> createProduct(ProductModel product, {File? file});
  Future<Either<Failure, ProductModel>> updateProduct(ProductModel product);
  Future<Either<Failure, void>> deleteProduct(String id);
}

class ProductRemoteDatasourceImp extends ProductRemoteDatasource {
  final http.Client client;
  final String baseUrl;

  ProductRemoteDatasourceImp({required this.client, required this.baseUrl});


  @override
  Future<Either<Failure, ProductModel>> createProduct(ProductModel product, {File? file}) async {
    try {
      final url = Uri.parse('$baseUrl/products');

      final request = http.MultipartRequest('POST', url)
        ..headers.addAll({'Content-Type': 'multipart/form-data'})
        ..fields['product'] = json.encode(product.toJson());

      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'file',
          file.path,
        ));
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return Right(ProductModel.fromJson(responseData['data']));
      } else {
        return const Left(ServerFailure('Failed to create product'));
      }
    } catch (e) {
      return const Left(ServerFailure('An error has occurred'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    final url = Uri.parse('$baseUrl/products/$id');
    final response = await client.delete(url);

    if (response.statusCode == 200) {
      return const Right(null);
    } else {
      return const Left(ServerFailure('Failed to delete product'));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(String id) async {
    final url = Uri.parse('$baseUrl/products/$id');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Right(ProductModel.fromJson(responseData['data']));
    } else if (response.statusCode == 404) {
      return const Left(ServerFailure('Product not found'));
    } else {
      return const Left(ServerFailure('Failed to fetch product'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    final url = Uri.parse('$baseUrl/products');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<ProductModel> products = (responseData['data'] as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
      return Right(products);
    } else {
      return const Left(ServerFailure('Failed to fetch products'));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateProduct(ProductModel product) async {
    final url = Uri.parse('$baseUrl/products/${product.id}');
    final response = await client.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Right(ProductModel.fromJson(responseData['data']));
    } else {
      return const Left(ServerFailure('Failed to update product'));
    }
  }
}

class MediaType {
}
