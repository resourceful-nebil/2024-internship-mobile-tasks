import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:product_6/core/errors/failure.dart';
import 'package:product_6/features/product/domain/entities/product.dart';
import 'package:product_6/features/product/domain/repository/product_repository.dart';
import 'package:product_6/features/product/domain/usecases/view_product.dart';

import 'view_all_products_test.mocks.dart';


@GenerateMocks([ProductRepository])
void main() {
  late ViewProductUseCase usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = ViewProductUseCase(mockProductRepository);
  });

  const String tProductId = '1';
  const Product tProduct = Product(
    id: tProductId,
    name: 'Product 1',
    description: 'Description 1',
    imageUrl: 'http://example.com/image1.jpg',
    price: 99.99,
  );

  test('should return product from repository when successful', () async {
    // arrange
    when(mockProductRepository.getProductById(any))
        .thenAnswer((_) async => const Right(tProduct));

    // act
    final result = await usecase(tProductId);

    // assert
    expect(result, const Right(tProduct));
    verify(mockProductRepository.getProductById(tProductId));
    verifyNoMoreInteractions(mockProductRepository);
  });

  test('should return failure when repository call is unsuccessful', () async {
    // arrange
    final tFailure = Failure(errMessage: 'Failed to get product');
    when(mockProductRepository.getProductById(any))
        .thenAnswer((_) async => Left(tFailure));

    // act
    final result = await usecase(tProductId);

    // assert
    expect(result, Left(tFailure));
    verify(mockProductRepository.getProductById(tProductId));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
