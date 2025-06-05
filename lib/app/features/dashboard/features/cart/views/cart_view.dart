import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:minimart/app/features/dashboard/features/cart/view_models/cart_vm.dart';
import 'package:minimart/app/features/dashboard/features/cart/widgets/cart_item.dart';
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
            const CustomBackButton(
              title: 'Your Carts',
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => Gap(15.h),
                itemBuilder: (context, index) {
                  final cart = cartP.carts[index];
                  return CartItem(
                    cart: cartP.carts[index],
                    addClick: () =>
                        cartPRead.increaseQuantity(productId: cart.product.id),
                    minusClick: () =>
                        cartPRead.decreaseQuantity(productId: cart.product.id),
                    trashClick: () =>
                        cartPRead.removeProduct(productId: cart.product.id),
                  );
                },
                itemCount: cartP.carts.length,
              ),
            ),
            Divider(
              color: theme.appBarTheme.secondaryBorder,
            ),
            Gap(12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
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
}
