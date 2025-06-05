import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minimart/core/models/products/product.dart';

part 'cart_model.freezed.dart';

@freezed
abstract class CartModel with _$CartModel {
  factory CartModel({
    required Product product,
    @Default(0) int id,
    @Default(0) int quantity,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) = _CartModel;

  factory CartModel.empty() => CartModel(
        product: Product(),
      );
}
