// import 'package:flutter/material.dart';
// import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
// import 'package:flutterproject/common/widgets/images/a_rounded_image.dart';
// import 'package:flutterproject/common/widgets/loaders/horizontal_product_shimmer.dart';
// import 'package:flutterproject/common/widgets/products/product_cards/product_card_horizontal.dart';
// import 'package:flutterproject/common/widgets/texts/section_heading.dart';
// import 'package:flutterproject/features/shop/controllers/category_controller.dart';
// import 'package:flutterproject/features/shop/models/category_model.dart';
// import 'package:flutterproject/features/shop/screens/all_products/all_products.dart';
// import 'package:flutterproject/utils/constants/image_strings.dart';
// import 'package:flutterproject/utils/constants/sizes.dart';
// import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';
// import 'package:get/get.dart';

// class SubCategoriesScreen extends StatelessWidget {
//   const SubCategoriesScreen({super.key, required this.category});

//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     final controller = CategoryController.instance;
//     return Scaffold(
//       appBar: AAppBar(
//         title: Text(category.name),
//         showBackArrow: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(Asizes.defaultSpace),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start, // Fix alignment
//             children: [
//               // Banner
//               LayoutBuilder(
//                 builder: (context, constraints) {
//                   return ARoundedImage(
//                     width: constraints.maxWidth, // Use maxWidth of the parent
//                     imageUrl: AImages.promoBanner2,
//                     applyImageRadius: true, isNetworkImage: false,
//                   );
//                 },
//               ),
//               const SizedBox(height: Asizes.spaceBtwSections),

//               // Sub Categories Section
//               FutureBuilder(
//                 future: controller.getSubCategories(category.id),
//                 builder: (context, asyncSnapshot) {
//                   // handle loader , no record and error messages
//                   const loader = AProductCardHorizontalShimmer();
//                   final widget = ACloudHelperFunctions.checkMultiRecordState(
//                       snapshot: asyncSnapshot, loader: loader);
//                   if (widget != null) return widget;

//                   // record found
//                   final subCategories = asyncSnapshot.data!;

//                   return ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: subCategories.length,
//                     itemBuilder: (_, index) {
//                       final subCategory = subCategories[index];
//                       return FutureBuilder(
//                           future: controller.getCategoryProducts(
//                               categoryId: subCategory.id),
//                           builder: (context, asyncSnapshot) {
//                             // handle loader , no record and error messages
//                             final widget =
//                                 ACloudHelperFunctions.checkMultiRecordState(
//                                     snapshot: asyncSnapshot, loader: loader);
//                             if (widget != null) return widget;

//                             // record found
//                             final products = asyncSnapshot.data!;

//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Heading
//                                 ASectionHeading(
//                                   title: subCategory.name,
//                                   onPressed: () => Get.to(
//                                     () => AllProducts(
//                                       title: subCategory.name,
//                                       futureMethod:
//                                           controller.getCategoryProducts(
//                                         categoryId: subCategory.id,
//                                         limit: -1,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                     height: Asizes.spaceBtwItems / 2),

//                                 // Product Card
//                                 SizedBox(
//                                   height:
//                                       120, // Constrain height for proper layout
//                                   child: ListView.separated(
//                                     itemCount: products.length,
//                                     scrollDirection: Axis.horizontal,
//                                     separatorBuilder: (context, index) =>
//                                         const SizedBox(
//                                       width: Asizes.spaceBtwItems,
//                                     ),
//                                     itemBuilder: (context, inde) =>
//                                         AProductCardHorizontal(
//                                             product: products[index]),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           });
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/images/a_rounded_image.dart';
import 'package:flutterproject/common/widgets/loaders/horizontal_product_shimmer.dart';
import 'package:flutterproject/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/features/shop/controllers/category_controller.dart';
import 'package:flutterproject/features/shop/models/category_model.dart';
import 'package:flutterproject/features/shop/screens/all_products/all_products.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: AAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner
              ARoundedImage(
                width: double.infinity, // Ensure banner takes full width
                imageUrl: AImages.promoBanner2,
                applyImageRadius: true,
                isNetworkImage: false,
              ),
              const SizedBox(height: Asizes.spaceBtwSections),

              // Sub Categories Section
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, asyncSnapshot) {
                  // handle loader , no record and error messages
                  const loader = AProductCardHorizontalShimmer();
                  final widget = ACloudHelperFunctions.checkMultiRecordState(
                      snapshot: asyncSnapshot, loader: loader);
                  if (widget != null) return widget;

                  // record found
                  final subCategories = asyncSnapshot.data!;

                  if (subCategories.isEmpty) {
                    return Center(
                      child: Text(
                        'No sub-categories found for ${category.name}.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subCategories.length,
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Heading for each sub-category
                          ASectionHeading(
                            title: subCategory.name,
                            onPressed: () => Get.to(
                              () => AllProducts(
                                title: subCategory.name,
                                futureMethod: controller.getCategoryProducts(
                                  categoryId: subCategory.id,
                                  limit: -1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: Asizes.spaceBtwItems / 2),

                          // Product Card List for each sub-category
                          FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryId: subCategory.id),
                              builder: (context, productSnapshot) {
                                // handle loader , no record and error messages
                                final productLoader =
                                    AProductCardHorizontalShimmer(); // Ensure loader is an instance
                                final productWidget =
                                    ACloudHelperFunctions.checkMultiRecordState(
                                        snapshot: productSnapshot,
                                        loader: productLoader);
                                if (productWidget != null) return productWidget;

                                // record found
                                // final products = productSnapshot.data!;
                                debugPrint(
                                    'Fetched Products: ${productSnapshot.data}');

                                final products =
                                    productSnapshot.data!.toSet().toList();

                                if (products.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'No products found for ${subCategory.name}.',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  );
                                }

                                return SizedBox(
                                  height: 120, // Constrain height
                                  child: ListView.separated(
                                    itemCount: products.length,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: Asizes.spaceBtwItems,
                                    ),
                                    itemBuilder: (context, index) =>
                                        AProductCardHorizontal(
                                            product: products[index]),
                                  ),
                                );
                              }),
                          const SizedBox(
                              height: Asizes
                                  .spaceBtwSections), // Space between sub-categories
                        ],
                      );
                    },
                  );
                },
              ),

              const SizedBox(
                height: Asizes.spaceBtwSections,
              )
            ],
          ),
        ),
      ),
    );
  }
}
