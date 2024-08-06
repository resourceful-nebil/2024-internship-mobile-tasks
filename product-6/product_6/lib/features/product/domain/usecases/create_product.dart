import 'package:dartz/dartz.dart';
import 'package:product_6/core/errors/failure.dart';
import 'package:product_6/core/usecases/usecase.dart';
import 'package:product_6/features/product/domain/entities/product.dart';
import 'package:product_6/features/product/domain/repository/product_repository.dart';

class CreateProductUseCase implements UseCase<Future<Either<Failure, Product>>, Product> {
  final ProductRepository repository;

  CreateProductUseCase(this.repository);

  @override
  Future<Either<Failure, Product>> call(Product product) async {
    return await repository.createProduct(product);
  }
}
