import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:minimart/core/models/cart/cart_model.dart';
import 'package:minimart/core/utils/utils.dart';
import 'package:minimart/core/widgets/widgets.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    required this.cart,
    required this.addClick,
    required this.minusClick,
    required this.trashClick,
    super.key,
  });
  final CartModel cart;
  final VoidCallback addClick;
  final VoidCallback minusClick;
  final VoidCallback trashClick;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 11.h),
      decoration: BoxDecoration(
        color: theme.backgroundTheme.onPrimary,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10.h,
          children: [
            Container(
              width: 103.h,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
                child: CustomImage(imageUrl: cart.product.image),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product.title,
                    style: theme.textStylesTheme.primaryDisplaySmall,
                  ),
                  Gap(6.h),
                  Text(
                    AppFormatter.money(cart.product.amount),
                    style: theme.textStylesTheme.primaryTitleSmall,
                  ),
                  Gap(6.h),
                  Text(
                    cart.product.total > cart.quantity
                        ? 'In stock'
                        : 'Out of Stock',
                    style: theme.textStylesTheme.inverseBodySmall,
                  ),
                  Gap(8.h),
                  Row(
                    spacing: 10.h,
                    children: [
                      Expanded(
                        child: Row(
                          spacing: 16.h,
                          children: [
                            CustomIconButton(
                              action: minusClick,
                              icon: Assets.svg.minusSVG,
                              iconHeight: 20,
                              height: 36,
                              iconColor: theme.buttonTheme.secondaryIconColor,
                              backgroundColor: theme.buttonTheme.secondaryColor,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(
                                cart.quantity.toString(),
                                style:
                                    theme.textStylesTheme.primaryDisplaySmall,
                              ),
                            ),
                            CustomIconButton(
                              action: addClick,
                              icon: Assets.svg.addSVG,
                              iconHeight: 20,
                              height: 36,
                              iconColor: theme.buttonTheme.primaryIconColor,
                              borderColor:
                                  theme.buttonTheme.tertiaryBorderColor,
                              backgroundColor: theme.buttonTheme.tertiaryColor,
                            ),
                          ],
                        ),
                      ),
                      CustomIconButton(
                        action: trashClick,
                        icon: Assets.svg.trashSVG,
                        iconHeight: 20,
                        height: 36,
                        iconColor: theme.buttonTheme.tertiaryIconColor,
                        backgroundColor: theme.buttonTheme.tertiaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
