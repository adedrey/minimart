import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:minimart/app/features/dashboard/features/cart/view_models/cart_vm.dart';
import 'package:minimart/app/features/dashboard/features/cart/widgets/cart_item.dart';
import 'package:minimart/core/utils/theme/app_theme.dart';
import 'package:minimart/core/utils/utils.dart';
import 'package:minimart/core/widgets/widgets.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  @override
  Widget build(BuildContext context) {
    final cartP = ref.watch(cartVMProvider);
    final cartPRead = ref.read(cartVMProvider.notifier);
    final theme = Theme.of(context).appTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              location: 'Umuezike Road, Oyo State',
            ),
            CustomBackButton(
              title: 'Your Carts',
              action: context.canPop() ? context.pop : () {},
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Gap(15.h),
                      itemBuilder: (context, index) {
                        final cart = cartP.carts[index];
                        return CartItem(
                          cart: cartP.carts[index],
                          addClick: () => cartPRead.increaseQuantity(
                            productId: cart.product.id,
                          ),
                          minusClick: () => cartPRead.decreaseQuantity(
                            productId: cart.product.id,
                          ),
                          trashClick: () => cartPRead.removeProduct(
                            productId: cart.product.id,
                          ),
                        );
                      },
                      itemCount: cartP.carts.length,
                    ),
                    Gap(15.h),
                    if (cartP.carts.isNotEmpty)
                      Column(
                        spacing: 15.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.orderInfo,
                            style: theme.textStylesTheme.labelLarge,
                          ),
                          _orderInfo(
                            theme,
                            title: AppString.subtotal,
                            amount: cartP.total,
                          ),
                          _orderInfo(
                            theme,
                            title: AppString.shipping,
                            amount: cartP.shipping,
                          ),
                          _orderInfo(
                            theme,
                            title: AppString.total,
                            amount: cartP.total + cartP.shipping,
                            isTotal: true,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Divider(
              color: theme.appBarTheme.secondaryBorder,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
              child: CustomButton(
                action: () {},
                label: AppString.checkout,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderInfo(
    AppTheme theme, {
    required String title,
    required num amount,
    bool isTotal = false,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textStylesTheme.labelSmall,
          ),
        ),
        Text(
          AppFormatter.money(amount, decimalDigits: 0),
          style: isTotal
              ? theme.textStylesTheme.labelLarge
              : theme.textStylesTheme.labelSmall,
        ),
      ],
    );
  }
}
