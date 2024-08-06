// Equatable helps us to override the == operator and hashCode operations
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final String? imageUrl;

  const ProductEntity({
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
  
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        
      ];
}
