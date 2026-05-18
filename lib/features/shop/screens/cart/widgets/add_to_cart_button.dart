import 'package:flutter/material.dart';
import 'package:flutterproject/features/shop/controllers/product/cart_controller.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        // if the product have variations then show the product details for variation selection.
        // else add product to the cart

        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem!);
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? AColors.primary : AColors.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Asizes.cardRadiusMd),
              bottomRight: Radius.circular(Asizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: Asizes.iconLg * 1.2,
            height: Asizes.iconLg * 1.2,
            child: Center(
                child: productQuantityInCart > 0
                    ? Text(
                        productQuantityInCart.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: AColors.white),
                      )
                    : const Icon(
                        Iconsax.add,
                        color: AColors.white,
                      )),
          ),
        );
      }),
    );
  }
}
