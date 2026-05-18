// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/common/widgets/images/a_rounded_image.dart';
import 'package:flutterproject/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:flutterproject/common/widgets/texts/a_brand_title_text_with_verified_icon.dart';
import 'package:flutterproject/common/widgets/texts/product_price_text.dart';
import 'package:flutterproject/common/widgets/texts/product_title_text.dart';
import 'package:flutterproject/features/shop/controllers/product/product_controller.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/features/shop/screens/cart/widgets/add_to_cart_button.dart';
import 'package:flutterproject/features/shop/screens/product_details/product_details.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class AProductCardHorizontal extends StatelessWidget {
  const AProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = AHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(
        () => ProductDetail(product: product),
      ),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Asizes.productImageRadius),
          color: dark ? AColors.darkerGrey : AColors.lightContainer,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Thumbnail
            ARoundedContainer(
              height: 120,
              width: 120,
              padding: const EdgeInsets.all(Asizes.sm),
              backgroundColor: dark ? AColors.dark : AColors.grey,
              child: Stack(
                children: [
                  // -- Thumbnail Image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Center(
                      child: ARoundedImage(
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                        isNetworkImage: true,
                      ),
                    ),
                  ),
                  // -- Sale Tag
                  if (salePercentage != null)
                    Positioned(
                      top: 0,
                      left: 1,
                      child: ARoundedContainer(
                        radius: Asizes.sm,
                        backgroundColor: AColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: Asizes.sm, vertical: Asizes.xs),
                        child: Text('$salePercentage%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: AColors.black)),
                      ),
                    ),

                  //favourite icon button
                  Positioned(
                    top: 0,
                    right: 1,
                    child: Center(
                      child: AFavouriteIcon(
                        productId: product.id,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // -- Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: Asizes.sm, left: Asizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Distribute space
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: AProductTitleText(
                            title: product.title,
                            smallSize: true,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(height: Asizes.spaceBtwItems / 2),
                        ABrandTitleTextWithVerifiedIcon(
                            title: product.brand!.name),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //price
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align price text to start
                            children: [
                              if (product.productType ==
                                      ProductType.single.toString() &&
                                  product.salePrice > 0)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: Asizes.sm),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsets.only(left: Asizes.xs),
                                child: AProductPriceText(
                                    price: controller.getProductPrice(product)),
                              ),
                            ],
                          ),
                        ),

                        // Add to cart button
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: AColors.dark,
                        //     borderRadius: const BorderRadius.only(
                        //       topLeft: Radius.circular(Asizes.cardRadiusMd),
                        //       bottomRight:
                        //           Radius.circular(Asizes.productImageRadius),
                        //     ),
                        //   ),
                        //   child: const SizedBox(
                        //     width: Asizes.iconLg * 1.2,
                        //     height: Asizes.iconLg * 1.2,
                        //     child: Center(
                        //       child: Icon(
                        //         Iconsax.add,
                        //         color: AColors.white,
                        //       ),
                        //     ),
                        //   ),
                        // )
                        ProductCardAddToCartButton(product: product),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
