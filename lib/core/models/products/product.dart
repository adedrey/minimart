import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  factory Product({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String image,
    @Default([]) List<String> about,
    @Default(0) num amount,
    @Default(0) int total,
    @Default(false) bool isFavorite,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) = _Product;

  factory Product.empty() => Product();
}
