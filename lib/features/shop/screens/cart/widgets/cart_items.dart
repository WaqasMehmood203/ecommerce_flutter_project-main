import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/products/cart/cart_add_remove.dart';
import 'package:flutterproject/common/widgets/products/cart/cart_item.dart';
import 'package:flutterproject/common/widgets/texts/product_price_text.dart';
import 'package:flutterproject/features/shop/controllers/product/cart_controller.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ACartItems extends StatelessWidget {
  const ACartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: Asizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              ACartItem(
                cartItem: item,
              ),
              if (showAddRemoveButtons)
                const SizedBox(
                  height: Asizes.spaceBtwItems,
                ),
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //ass remove buttons
                    AProductQuantityWithAddAndRemove(
                      quantity: item.quantity,
                      add: () => cartController.addOneToCart(item),
                      remove: () => cartController.removeOneFromCart(item),
                    ),
                    AProductPriceText(
                        price: (item.salePrice * item.quantity).toStringAsFixed(1)),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
