import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/models/products/product.dart';
import 'package:minimart/core/widgets/common/products/product_tile.dart';

class HomeProducts extends ConsumerWidget {
  const HomeProducts({required this.products, super.key});
  final List<Product> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15.h,
      crossAxisSpacing: 10.w,
      childAspectRatio: .7,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        products.length,
        (index) {
          final product = products[index];
          return ProductTile(
            product: product,
            action: () {},
          );
        },
      ),
    );
  }
}
