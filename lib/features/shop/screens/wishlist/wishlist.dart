import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/icons/circular_icon.dart';
import 'package:flutterproject/common/widgets/layouts/grid_layout.dart';
import 'package:flutterproject/common/widgets/loaders/animation_loader.dart';
import 'package:flutterproject/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:flutterproject/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutterproject/features/shop/controllers/product/favourites_controller.dart';
import 'package:flutterproject/features/shop/screens/home/home.dart';
import 'package:flutterproject/navigation_menu.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: AAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          ACircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Asizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context, asyncSnapshot) {
                      //nothing found widget
                      final emptyWidget = AAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty...',
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                        animation: AImages.pencilAnimation,
                      );

                      const loader = AVerticalProductShimmer(
                        itemCount: 6,
                      );
                      final widget =
                          ACloudHelperFunctions.checkMultiRecordState(
                              snapshot: asyncSnapshot,
                              loader: loader,
                              nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = asyncSnapshot.data!;

                      return AGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => AProductCardVertical(
                          product: products[index],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
