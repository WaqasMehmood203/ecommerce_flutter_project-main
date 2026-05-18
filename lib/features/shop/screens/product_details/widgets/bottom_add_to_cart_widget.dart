import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/icons/circular_icon.dart';
import 'package:flutterproject/features/shop/controllers/product/cart_controller.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class ABottomAddToCart extends StatelessWidget {
  const ABottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = AHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Asizes.defaultSpace, vertical: Asizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? AColors.darkerGrey : AColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Asizes.cardRadiusLg),
          topRight: Radius.circular(Asizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ACircularIcon(
                  icon: Iconsax.minus,
                  baclgroundColor: AColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: AColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(
                  width: Asizes.spaceBtwItems,
                ),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: Asizes.spaceBtwItems,
                ),
                ACircularIcon(
                  icon: Iconsax.add,
                  baclgroundColor: AColors.black,
                  width: 40,
                  height: 40,
                  color: AColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              icon: Icon(
                Iconsax.shopping_bag,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AColors.dark,
                padding: const EdgeInsets.all(Asizes.lg),
                side: const BorderSide(color: AColors.black),
              ),
              label: const Text('Add to Cart' , style: TextStyle(color: AColors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
