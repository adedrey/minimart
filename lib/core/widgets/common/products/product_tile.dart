import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/models/products/product.dart';
import 'package:minimart/core/utils/utils.dart'
    show AppFormatter, ThemeDataExtended;
import 'package:minimart/core/widgets/widgets.dart'
    show CustomImage, TouchableOpacity;
import 'package:skeletonizer/skeletonizer.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    required this.product,
    required this.action,
    this.isLoading = false,
    super.key,
  });
  final Product product;
  final VoidCallback action;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appTheme;
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200,
        duration: const Duration(seconds: 1),
      ),
      child: TouchableOpacity(
        onTap: action,
        constraints: BoxConstraints(maxWidth: 162.h, maxHeight: 238.h),
        child: Column(
          spacing: 5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Skeleton.leaf(
              child: Container(
                width: 162.h,
                height: 162.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9.r),
                  child: CustomImage(imageUrl: product.image),
                ),
              ),
            ),
            Skeleton.leaf(
              child: Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textStylesTheme.displaySmall,
              ),
            ),
            Skeleton.leaf(
              child: Text(
                AppFormatter.money(product.amount),
                style: theme.textStylesTheme.displayLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
