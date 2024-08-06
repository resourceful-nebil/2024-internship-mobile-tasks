import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:product_6/core/errors/failure.dart';
import 'package:product_6/features/product/domain/entities/product.dart';
import 'package:product_6/features/product/domain/repository/product_repository.dart';
import 'package:product_6/features/product/domain/usecases/create_product.dart';

import 'view_all_products_test.mocks.dart';


@GenerateMocks([ProductRepository])
void main() {
  late CreateProductUseCase usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = CreateProductUseCase(mockProductRepository);
  });

  const Product tProduct = Product(
    id: '1',
    name: 'Product 1',
    description: 'Description 1',
    imageUrl: 'http://example.com/image1.jpg',
    price: 99.99,
  );

  test('should create a product in the repository', () async {
    // arrange
    when(mockProductRepository.createProduct(any))
        .thenAnswer((_) async => Right(tProduct));

    // act
    final result = await usecase(tProduct);

    // assert
    expect(result, Right(tProduct));
    verify(mockProductRepository.createProduct(tProduct));
    verifyNoMoreInteractions(mockProductRepository);
  });

  test('should return failure when repository call is unsuccessful', () async {
    // arrange
    final tFailure = Failure(errMessage: 'Failed to create product');
    when(mockProductRepository.createProduct(any))
        .thenAnswer((_) async => Left(tFailure));

    // act
    final result = await usecase(tProduct);

    // assert
    expect(result, Left(tFailure));
    verify(mockProductRepository.createProduct(tProduct));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
