import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/utils/constants.dart';
import 'package:minimart/core/widgets/common/products/product_tile.dart';

class ProductsShimmer extends StatelessWidget {
  const ProductsShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15.h,
      crossAxisSpacing: 10.w,
      childAspectRatio: .7,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        4,
        (index) => ProductTile(
          product: Constants.products[0],
          isLoading: true,
          action: () {},
        ),
      ),
    );
  }
}
