import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:minimart/core/models/products/product.dart';
import 'package:minimart/core/providers/products/product_vm.dart';
import 'package:minimart/core/utils/theme/app_theme.dart';
import 'package:minimart/core/utils/utils.dart';
import 'package:minimart/core/widgets/customs/custom_appbar.dart';
import 'package:minimart/core/widgets/customs/custom_back_button.dart';
import 'package:minimart/core/widgets/widgets.dart'
    show CustomIconButton, CustomImage;

class ProductDetail extends ConsumerStatefulWidget {
  const ProductDetail({required this.id, super.key});
  final int id;

  @override
  ConsumerState<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  Product? product;
  @override
  void initState() {
    super.initState();
    fetchInitData.afterFrame();
  }

  void fetchInitData() {
    product =
        ref.read(productVMProvider.notifier).getProductById(id: widget.id);
    setState(() {});
  }

  void addToFav() {
    ref.read(productVMProvider.notifier).addToFav(id: widget.id);
    setState(() {
      product = product!.copyWith(isFavorite: !product!.isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).appTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              location: 'Umuezike Road, Oyo State',
            ),
            const CustomBackButton(),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
                child: product == null
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 331.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9.r)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(9.r),
                                  child: CustomImage(imageUrl: product!.image),
                                ),
                              ),
                              Positioned(
                                right: 14.h,
                                top: 11.h,
                                child: CustomIconButton(
                                  icon: product!.isFavorite
                                      ? Assets.svg.loveSVG
                                      : Assets.svg.likeSVG,
                                  iconHeight: 24,
                                  height: 44,
                                  backgroundColor:
                                      theme.buttonTheme.tertiaryColor,
                                  action: addToFav,
                                ),
                              ),
                            ],
                          ),
                          Gap(11.h),
                          Text(
                            product!.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textStylesTheme.primaryTitleSmall
                                .copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(6.h),
                          Text(
                            AppFormatter.money(product!.amount),
                            style: theme.textStylesTheme.bodyLarge,
                          ),
                          Gap(15.h),
                          Text(
                            AppString.aboutThisItem,
                            style: theme.textStylesTheme.bodySmall,
                          ),
                          ...product!.about.map(
                            (about) => _productFeature(
                              theme,
                              description: about,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            Divider(
              color: theme.appBarTheme.secondaryBorder,
            ),
          ],
        ),
      ),
    );
  }

  Widget _productFeature(AppTheme theme, {required String description}) {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 4,
          width: 4,
          margin: EdgeInsets.only(top: 8.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.textStylesTheme.bodySmall.color,
          ),
        ),
        Expanded(
          child: Text(
            description,
            style: theme.textStylesTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
