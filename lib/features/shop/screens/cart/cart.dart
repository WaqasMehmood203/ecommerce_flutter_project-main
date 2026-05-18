import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/empty_state/empty_state.dart';
import 'package:flutterproject/features/shop/controllers/product/cart_controller.dart';
import 'package:flutterproject/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutterproject/features/shop/screens/checkout/checkout.dart';
import 'package:flutterproject/navigation_menu.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: AAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        // Nothing found widget

        final emptyWidget = AEmptyState(
          title: 'Your cart is empty',
          subtitle: 'Add a few items and we will save them for checkout.',
          animation: AImages.cartAnimation,
          buttonText: 'Shop now',
          onButtonPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: const Padding(
              padding: EdgeInsets.all(Asizes.defaultSpace),
              child: ACartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: Obx(
        () => controller.cartItems.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(Asizes.defaultSpace),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Text('Checkout \$${controller.totalCartPrice.value}'),
                ),
              ),
      ),
    );
  }
}
