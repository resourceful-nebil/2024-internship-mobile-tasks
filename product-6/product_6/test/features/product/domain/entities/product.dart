// Equatable helps us to override the == operator and hashCode operations
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? productId;
  final String? imageUrl;
  final String? productName;
  final String? productType;
  final String? productRating;
  final int? productPrice;
  final String? productDescription;

  const ProductEntity({
    this.productId,
    this.imageUrl,
    this.productName,
    this.productType,
    this.productRating,
    this.productPrice,
    this.productDescription,
  });

  @override
  List<Object?> get props => [
        productId,
        productName,
        productType,
        productRating,
        productPrice,
        productDescription,
        imageUrl,
      ];
}
