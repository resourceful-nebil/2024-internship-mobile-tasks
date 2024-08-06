import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:product_6/core/errors/failure.dart';
import 'package:product_6/features/product/domain/repository/product_repository.dart';
import 'package:product_6/features/product/domain/usecases/delete_product.dart';

import 'view_all_products_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late DeleteProductUseCase usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = DeleteProductUseCase(mockProductRepository);
  });

  const String tProductId = '1';

  test('should delete a product from the repository', () async {
    // arrange
    when(mockProductRepository.deleteProduct(any))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await usecase(tProductId);

    // assert
    expect(result, const Right(null));
    verify(mockProductRepository.deleteProduct(tProductId));
    verifyNoMoreInteractions(mockProductRepository);
  });

  test('should return failure when repository call is unsuccessful', () async {
    // arrange
    final tFailure = Failure(errMessage: 'Failed to delete product');
    when(mockProductRepository.deleteProduct(any))
        .thenAnswer((_) async => Left(tFailure));

    // act
    final result = await usecase(tProductId);

    // assert
    expect(result, Left(tFailure));
    verify(mockProductRepository.deleteProduct(tProductId));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
