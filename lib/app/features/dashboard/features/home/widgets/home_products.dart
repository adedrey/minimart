import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:minimart/core/models/products/product.dart';
import 'package:minimart/core/routes/app_routes.dart';
import 'package:minimart/core/widgets/common/products/product_tile.dart';

class HomeProducts extends ConsumerWidget {
  const HomeProducts({required this.products, super.key});
  final List<Product> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15.h,
      crossAxisSpacing: 10.w,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductTile(
          product: product,
          action: () => ProductDetailRoute(id: product.id).go(context),
        );
      },
      itemCount: products.length,
    );
    // return GridView.count(
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 15.h,
    //   crossAxisSpacing: 10.w,
    //   shrinkWrap: true,
    //   padding: EdgeInsets.symmetric(vertical: 10.h),
    //   physics: const NeverScrollableScrollPhysics(),
    //   children: List.generate(
    //     products.length,
    //     (index) => ProductTile(
    //       product: products[index],
    //       action: () => ProductDetailRoute(id: products[index].id).go(context),
    //     ),
    //   ),
    // );
    // return GridView.count(
    //   itemCount: products.length,
    //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 200.w,
    //     mainAxisSpacing: 15.h,
    //     crossAxisSpacing: 10.w,
    //     childAspectRatio:
    //         WidgetHelper.getAppDeviceType() == PlatformDeviceType.tablet
    //             ? (isLandscape ? 2.h : 1.h)
    //             : 1,
    //   ),
    //   padding: EdgeInsets.symmetric(vertical: 10.h),
    //   physics: const NeverScrollableScrollPhysics(),
    // itemBuilder: (context, index) {
    //   final product = products[index];
    //   return ProductTile(
    //     product: product,
    //     action: () => ProductDetailRoute(id: product.id).go(context),
    //   );
    // },
    //   shrinkWrap: true,
    // );
  }
}
