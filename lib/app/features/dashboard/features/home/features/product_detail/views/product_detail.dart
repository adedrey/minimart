import 'package:flutter/material.dart';
import 'package:minimart/core/models/products/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({required this.id, required this.product, super.key});
  final int id;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
