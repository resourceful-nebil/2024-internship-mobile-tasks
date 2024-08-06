import 'package:dartz/dartz.dart';
import 'package:product_6/core/errors/failure.dart';
import 'package:product_6/core/usecases/usecase.dart';
import 'package:product_6/features/product/domain/entities/product.dart';
import 'package:product_6/features/product/domain/repository/product_repository.dart';

class ViewProductUseCase implements UseCase<Future<Either<Failure, Product>>, String> {
  final ProductRepository repository;

  ViewProductUseCase(this.repository);

  @override
  Future<Either<Failure, Product>> call(String id) async {
    return await repository.getProductById(id);
  }
}


