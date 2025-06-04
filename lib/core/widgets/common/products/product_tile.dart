import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/models/products/product.dart';
import 'package:minimart/core/utils/utils.dart'
    show AppFormatter, ThemeDataExtended;
import 'package:minimart/core/widgets/widgets.dart'
    show CustomImage, TouchableOpacity;

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, required this.action, super.key});
  final Product product;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appTheme;
    return TouchableOpacity(
      onTap: action,
      child: SizedBox(
        height: 229.h,
        child: Column(
          spacing: 5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 162.h,
              height: 162.h,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
                child: CustomImage(imageUrl: product.image),
              ),
            ),
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textStylesTheme.displaySmall,
            ),
            Text(
              AppFormatter.money(product.amount),
              style: theme.textStylesTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
