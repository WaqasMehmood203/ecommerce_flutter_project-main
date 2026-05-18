import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/layouts/grid_layout.dart';
import 'package:flutterproject/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:flutterproject/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/features/shop/controllers/category_controller.dart';
import 'package:flutterproject/features/shop/models/category_model.dart';
import 'package:flutterproject/features/shop/screens/all_products/all_products.dart';
import 'package:flutterproject/features/shop/screens/store/widgets/category_brands.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class ACategoryTab extends StatelessWidget {
  const ACategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //brands

                CategoryBrands(category: category),
                const SizedBox(
                  height: Asizes.spaceBtwItems,
                ),

                //products

                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, asyncSnapshot) {
                      //helper function , handle loader no record or error message

                      final response =
                          ACloudHelperFunctions.checkMultiRecordState(
                              snapshot: asyncSnapshot,
                              loader: const AVerticalProductShimmer());
                      if (response != null) return response;

                      // record found
                      final products = asyncSnapshot.data!;

                      return Column(
                        children: [
                          ASectionHeading(
                            title: 'You might like',
                            onPressed: () => Get.to(AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            )),
                          ),
                          const SizedBox(
                            height: Asizes.spaceBtwItems,
                          ),
                          AGridLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) => AProductCardVertical(
                              product: products[index],
                            ),
                          ),
                        ],
                      );
                    }),
                const SizedBox(
                  height: Asizes.spaceBtwSections,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
