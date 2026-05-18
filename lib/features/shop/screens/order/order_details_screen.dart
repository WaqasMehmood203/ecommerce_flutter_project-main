import 'package:flutter/material.dart';
import 'package:flutterproject/common/styles/spacing_styles.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:flutterproject/features/shop/screens/order/widgets/order_details_header.dart';
import 'package:flutterproject/features/shop/screens/order/widgets/order_items_widget.dart';
import 'package:flutterproject/features/shop/screens/order/widgets/order_summary_widget.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AAppBar(
        showBackArrow: true,
        title: Text(
          'Order Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ASpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Order Header
              OrderDetailsHeader(order: order),
              const SizedBox(height: Asizes.spaceBtwSections),

              // Order Items
              OrderItemsWidget(order: order),
              const SizedBox(height: Asizes.spaceBtwSections),

              // Order Summary
              OrderSummaryWidget(order: order),
              const SizedBox(height: Asizes.spaceBtwSections),

              // Shipping Address Section
              ARoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(Asizes.md),
                backgroundColor: dark ? AColors.black : AColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Address',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: Asizes.spaceBtwItems),
                    if (order.address != null) ...[
                      Text(
                        order.address!.name,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems / 2),
                      Text(
                        order.address!.phoneNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems / 2),
                      Text(
                        '${order.address!.street}, ${order.address!.city}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems / 2),
                      Text(
                        '${order.address!.state} ${order.address!.postalCode}, ${order.address!.country}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ] else
                      Text(
                        'No shipping address available',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: Asizes.spaceBtwSections),

              // Transaction Details
              ARoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(Asizes.md),
                backgroundColor: dark ? AColors.black : AColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transaction Details',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: Asizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: Asizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          order.paymentMethod,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Asizes.spaceBtwItems / 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Status',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Asizes.md,
                            vertical: Asizes.sm,
                          ),
                          decoration: BoxDecoration(
                            color: AColors.primary.withOpacity(0.2),
                            borderRadius:
                                BorderRadius.circular(Asizes.borderRadiusSm),
                          ),
                          child: Text(
                            'Completed',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    if (order.paymentInfo != null) ...[
                      const SizedBox(height: Asizes.spaceBtwItems / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction ID',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            order.paymentInfo!.transactionId,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: Asizes.spaceBtwSections),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: const Text('Back to Orders'),
                    ),
                  ),
                  const SizedBox(width: Asizes.spaceBtwItems),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        AHelperFunctions.showSnackBar(
                          'Tracking details coming soon!',
                        );
                      },
                      child: const Text('Track Order'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Asizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
