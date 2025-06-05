import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minimart/core/models/cart/cart_model.dart';
import 'package:minimart/core/providers/products/product_vm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_vm.freezed.dart';
part 'cart_vm.g.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(0) num total,
    @Default([]) List<CartModel> carts,
    String? errorMessage,
  }) = _CartState;

  factory CartState.initial() => const CartState();
}

@Riverpod(keepAlive: true)
class CartVM extends _$CartVM {
  @override
  CartState build() => CartState.initial();

  void addToCart({required CartModel cart}) {
    final index = _findProductIndex(cart.product.id);
    if (index != -1) {
      increaseQuantity(productId: cart.product.id);
    } else {
      if (_checkIfProductIsInStock(cart.product.id, 1)) {
        _updateTotalAndCarts([...state.carts, cart.copyWith(quantity: 1)]);
      }
    }
  }

  void increaseQuantity({required int productId}) {
    final index = _findProductIndex(productId);
    if (index == -1) return;

    final cart = state.carts[index];
    final nextquantity = cart.quantity + 1;

    if (_checkIfProductIsInStock(productId, nextquantity)) {
      _replaceAt(index, cart.copyWith(quantity: nextquantity));
    }
  }

  void decreaseQuantity({required int productId}) {
    final index = _findProductIndex(productId);
    if (index == -1) return;

    final cart = state.carts[index];
    final nextquantity = cart.quantity - 1;

    if (nextquantity < 1) {
      removeProduct(productId: productId);
    } else {
      _replaceAt(index, cart.copyWith(quantity: nextquantity));
    }
  }

  void removeProduct({required int productId}) {
    final newCarts =
        state.carts.where((c) => c.product.id != productId).toList();
    _updateTotalAndCarts(newCarts);
  }

  int _findProductIndex(int productId) =>
      state.carts.indexWhere((c) => c.product.id == productId);

  void _replaceAt(int index, CartModel updatedCart) {
    final newCarts = [...state.carts];
    newCarts[index] = updatedCart;
    _updateTotalAndCarts(newCarts);
  }

  void _updateTotalAndCarts(List<CartModel> newCarts) {
    final total = newCarts.fold<num>(
      0,
      (sum, cart) => sum + (cart.quantity * cart.product.amount),
    );
    state = state.copyWith(carts: newCarts, total: total);
  }

  bool _checkIfProductIsInStock(int productId, int quantity) {
    final productVM = ref.read(productVMProvider.notifier);
    return productVM.isProductInStock(id: productId, total: quantity);
  }
}
