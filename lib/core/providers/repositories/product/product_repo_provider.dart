import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimart/core/repositories/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repo_provider.g.dart';

@Riverpod(keepAlive: true)
ProductRepository productRepository(
  Ref ref,
) {
  return const ProductRepository();
}
