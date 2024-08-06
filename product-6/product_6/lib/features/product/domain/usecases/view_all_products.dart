import 'package:dartz/dartz.dart';
import 'package:product_6/core/errors/failure.dart';
import 'package:product_6/core/usecases/no_param_use_cases.dart';
import 'package:product_6/core/usecases/usecase.dart';
import 'package:product_6/features/product/domain/entities/product.dart';
import 'package:product_6/features/product/domain/repository/product_repository.dart';

class ViewAllProductsUseCase
    implements
        
        
        NoParamsUseCase<Future<Either<Failure, List<Product>>>> {
  final ProductRepository repository;

  ViewAllProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getProducts();
  }
}


