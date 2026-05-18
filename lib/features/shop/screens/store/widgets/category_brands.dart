import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/brand/brand_show_case.dart';
import 'package:flutterproject/common/widgets/loaders/a_list_tile_shimmer.dart';
import 'package:flutterproject/common/widgets/loaders/boxes_shimmer.dart';
import 'package:flutterproject/features/shop/controllers/brand_controller.dart';
import 'package:flutterproject/features/shop/models/category_model.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, asyncSnapshot) {
          //handle loader , no record , or error message

          const loader = Column(
            children: [
              AListTileShimmer(),
              SizedBox(
                height: Asizes.spaceBtwItems,
              ),
              ABoxesShimmer(),
              SizedBox(
                height: Asizes.spaceBtwItems,
              ),
            ],
          );

          final widget = ACloudHelperFunctions.checkMultiRecordState(
              snapshot: asyncSnapshot, loader: loader);
          if (widget != null) return widget;

          // record found
          final brands = asyncSnapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, asyncSnapshot) {
                    //handle loader , no record , or error message

                    final widget = ACloudHelperFunctions.checkMultiRecordState(
                        snapshot: asyncSnapshot, loader: loader);
                    if (widget != null) return widget;

                    // record found
                    final products = asyncSnapshot.data!;

                    return TBrandShowCase(
                      images: products.map((e) => e.thumbnail).toList(),
                      brand: brand,
                    );
                  });
            },
          );
        });
  }
}
