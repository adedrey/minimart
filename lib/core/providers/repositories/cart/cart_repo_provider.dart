import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimart/core/repositories/cart/cart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repo_provider.g.dart';

@Riverpod(keepAlive: true)
CartRepository cartRepository(
  Ref ref,
) {
  return const CartRepository();
}
