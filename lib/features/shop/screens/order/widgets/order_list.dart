import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/common/widgets/loaders/animation_loader.dart';
import 'package:flutterproject/features/shop/controllers/product/order_controller.dart';
import 'package:flutterproject/features/shop/screens/order/order_details_screen.dart';
import 'package:flutterproject/navigation_menu.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AOrderListItems extends StatelessWidget {
  const AOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = AHelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, asyncSnapshot) {
          //Nothing found widget
          final emptyWidget = AAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: AImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it.',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          //Helper function handle loader , no record , or error message
          final response = ACloudHelperFunctions.checkMultiRecordState(
              snapshot: asyncSnapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          //congratulations ! record found.
          final orders = asyncSnapshot.data!;

          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, __) => const SizedBox(
              height: Asizes.spaceBtwItems,
            ),
            itemBuilder: (_, index) {
              final order = orders[index];
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => OrderDetailsScreen(order: order),
                    transition: Transition.rightToLeft,
                  );
                },
                child: ARoundedContainer(
                  showBorder: true,
                  padding: EdgeInsets.all(Asizes.md),
                  backgroundColor: dark ? AColors.dark : AColors.light,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //row 1
                      Row(
                        children: [
                          // 1 - icon
                          Icon(Iconsax.ship),
                          SizedBox(
                            width: Asizes.spaceBtwItems / 2,
                          ),

                          // 2 - status and date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.orderStatusText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: AColors.primary,
                                          fontWeightDelta: 1),
                                ),
                                Text(
                                  order.formattedOrderDate,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ),
                          //icon
                          IconButton(
                            onPressed: () {
                              Get.to(
                                () => OrderDetailsScreen(order: order),
                                transition: Transition.rightToLeft,
                              );
                            },
                            icon: const Icon(
                              Iconsax.arrow_right_34,
                              size: Asizes.iconSm,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: Asizes.spaceBtwItems,
                      ),

                      //row 2
                      Row(
                        children: [
                          //row 2 ky ander row 1
                          Expanded(
                            child: Row(
                              children: [
                                // 1 - icon
                                Icon(Iconsax.tag),
                                SizedBox(
                                  width: Asizes.spaceBtwItems / 2,
                                ),

                                // 2 - status and date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Order',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(
                                        '#${order.formattedOrderId}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //row 2 ky ander row 2
                          Expanded(
                            child: Row(
                              children: [
                                // 1 - icon
                                Icon(Iconsax.calendar),
                                SizedBox(
                                  width: Asizes.spaceBtwItems / 2,
                                ),

                                // 2 - status and date
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Delivery',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      Text(
                                        order.formattedDeliveryDate.isNotEmpty
                                            ? order.formattedDeliveryDate
                                            : 'Pending',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

