import 'package:minimart/core/models/products/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_vm.g.dart';

@Riverpod(keepAlive: true)
class ProductVM extends _$ProductVM {
  @override
  List<Product> build() => [];

  Product? getProductById({required int id}) {
    final selectedProduct = state.firstWhere(
      (product) => product.id == id,
      orElse: Product.new,
    );
    return selectedProduct.id == 0 ? null : selectedProduct;
  }

  int getProductIndexById({required int id}) {
    return state.indexWhere((product) => product.id == id);
  }

  void checkout({required int id, required int total}) {
    final productIndex = getProductIndexById(id: id);
    if (productIndex >= 0) {
      final product = state[productIndex];
      final currentProductsState = state;
      currentProductsState[productIndex] =
          product.copyWith(total: product.total - total);
      state = currentProductsState;
    }
  }

  bool isProductInStock({required int id, required int total}) {
    final product = getProductById(id: id);
    if (product != null) {
      return product.total >= total;
    }
    return false;
  }
}
