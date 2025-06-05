import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/app/features/dashboard/features/home/view_models/home_vm.dart';
import 'package:minimart/app/features/dashboard/features/home/widgets/home_products.dart';
import 'package:minimart/core/providers/products/product_vm.dart';
import 'package:minimart/core/utils/utils.dart';
import 'package:minimart/core/widgets/customs/custom_appbar.dart';
import 'package:minimart/core/widgets/customs/custom_back_button.dart';
import 'package:minimart/core/widgets/shimmers/product_shimmer.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchInitData.afterFrame();
  }

  void fetchInitData() {
    ref.read(homeVMProvider.notifier).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final homeP = ref.watch(homeVMProvider);
    ref.listen(homeVMProvider.select((value) => value), (previous, next) {
      if (next is Failure) {
        next.errorMessage?.showAsErrorToast(context);
      }
    });
    return Scaffold(
      body: SafeArea(
        minimum: WidgetHelper.safeArea(),
        child: Column(
          children: [
            CustomAppBar(
              location: 'Umuezike Road, Oyo State',
              controller: searchController,
              showInput: true,
            ),
            CustomBackButton(
              title: 'Technology',
              action: () {},
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () =>
                    ref.read(homeVMProvider.notifier).fetchProducts(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: homeP is Loading
                      ? const ProductsShimmer()
                      : ref.watch(productVMProvider).isEmpty
                          ? Container()
                          : HomeProducts(
                              products: ref.watch(productVMProvider),
                            ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
