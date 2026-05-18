import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/brand/brandcard.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/common/widgets/loaders/shimmer.dart';
import 'package:flutterproject/features/shop/models/brand_model.dart';
import 'package:flutterproject/features/shop/screens/brand/brand_products.dart';
import 'package:flutterproject/utils/constants/colors.dart';
// import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: ARoundedContainer(
        showBorder: true,
        borderColor: AColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: Asizes.spaceBtwItems),
        padding: const EdgeInsets.all(Asizes.md),
        child: Column(
          children: [
            //brands with product count

            ABrandCard(
              showBorder: false,
              brand: brand,
            ),

            const SizedBox(
              height: Asizes.spaceBtwItems,
            ),

            //brand with top 3 images

            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: ARoundedContainer(
        height: 100,
        padding: const EdgeInsets.only(right: Asizes.xs),
        margin: const EdgeInsets.only(right: Asizes.sm),
        backgroundColor: AHelperFunctions.isDarkMode(context)
            ? AColors.darkGrey
            : AColors.light,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const AShimmerEffect(width: 100, height: 100),
        )),
  );
}
