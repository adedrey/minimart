import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/app/features/dashboard/features/home/widgets/home_products.dart';
import 'package:minimart/core/utils/utils.dart';
import 'package:minimart/core/widgets/customs/custom_appbar.dart';
import 'package:minimart/core/widgets/customs/custom_back_button.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              location: 'Umuezike Road, Oyo State',
              controller: searchController,
              showInput: true,
            ),
            const CustomBackButton(),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: HomeProducts(
                  products: Constants.products,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
