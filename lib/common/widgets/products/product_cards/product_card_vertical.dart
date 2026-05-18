// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterproject/common/styles/shadows.dart';
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

class AProductCardVertical extends StatelessWidget {
  const AProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = AHelperFunctions.isDarkMode(context);
    //container with side paddings , color , edges , radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [AShadowStyle.vericalProductShadow],
          borderRadius: BorderRadius.circular(Asizes.productImageRadius),
          color: dark ? AColors.darkerGrey : AColors.white,
        ),
        child: Column(
          children: [
            //thumbnail , wishlist button , discount tag
            ARoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(Asizes.sm),
              backgroundColor: dark ? AColors.dark : AColors.light,
              child: Stack(
                children: [
                  //thumbnail image
                  // Center(
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Center(
                      child: ARoundedImage(
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                        backgroundColor: dark ? AColors.dark : AColors.light,
                        isNetworkImage: true,
                      ),
                    ),
                  ),
                  // ),
                  if (salePercentage != null)
                    Positioned(
                      top: 0,
                      left: 5,
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
                    right: 5,
                    child: Center(
                      child: AFavouriteIcon(
                        productId: product.id,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Asizes.spaceBtwItems / 2,
            ),

            //details

            Padding(
              padding: EdgeInsets.only(left: Asizes.xs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  SizedBox(
                    height: Asizes.spaceBtwItems / 2,
                  ),
                  ABrandTitleTextWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: Asizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(left: Asizes.sm),
                        child: AProductPriceText(
                            price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                // Add to cart button
                ProductCardAddToCartButton(
                  product: product,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
