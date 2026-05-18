import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/icons/circular_icon.dart';
import 'package:flutterproject/features/shop/controllers/product/favourites_controller.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AFavouriteIcon extends StatelessWidget {
  const AFavouriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => ACircularIcon(
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? AColors.error : null,
        height: 30,
        width: 31,
        size: Asizes.iconSm,
        onPressed: () => controller.toggleFavouriteProduct(productId),
      ),
    );
  }
}
