import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutterproject/common/widgets/images/a_rounded_image.dart';
import 'package:flutterproject/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:flutterproject/features/shop/controllers/product/images_controller.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AProductImageSlider extends StatelessWidget {
  const AProductImageSlider({
    super.key,
    required this.dark,
    required this.product,
  });

  final bool dark;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return ACurvedEdgeWidget(
      child: Container(
        color: dark ? AColors.darkerGrey : AColors.light,
        child: Stack(
          children: [
            //main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(Asizes.productImageRadius * 2),
                child: Center(
                  child: Obx(
                    () {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: () => controller.showEnlargedImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: AColors.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            //image slider

            Positioned(
              right: 0,
              bottom: 30,
              left: Asizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    width: Asizes.spaceBtwItems,
                  ),
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return ARoundedImage(
                      width: 80,
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                      backgroundColor: dark ? AColors.dark : AColors.white,
                      border: Border.all(
                          color: imageSelected
                              ? AColors.primary
                              : Colors.transparent),
                      padding: EdgeInsets.all(Asizes.sm),
                      imageUrl: images[index],
                      isNetworkImage: true,
                    );
                  }),
                ),
              ),
            ),

            //appbar icons

            AAppBar(
              showBackArrow: true,
              actions: [
                AFavouriteIcon(productId: product.id,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
