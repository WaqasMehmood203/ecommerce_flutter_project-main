import 'package:flutter/material.dart';
import 'package:flutterproject/common/styles/spacing_styles.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:flutterproject/features/shop/screens/order/order_details_screen.dart';
import 'package:flutterproject/navigation_menu.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: ASpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                // Animation
                Lottie.asset(
                  AImages.orderCompletedAnimation,
                  width: AHelperFunctions.screenWidth() * 0.6,
                  repeat: false,
                ),
                const SizedBox(height: Asizes.spaceBtwSections),

                // Title & SubTitle
                Text(
                  'Order Placed Successfully!',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Asizes.spaceBtwItems),
                Text(
                  'Thank you for your purchase. Your order is being processed.',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Asizes.spaceBtwSections),

                // Order Details Card
                ARoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(Asizes.md),
                  backgroundColor: dark ? AColors.black : AColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Details',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems),
                      const Divider(),
                      const SizedBox(height: Asizes.spaceBtwItems),

                      // Order ID
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order ID',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '#${order.formattedOrderId}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems / 2),

                      // Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            order.formattedOrderDate,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems / 2),

                      // Payment Method
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Method',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            order.paymentMethod,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems / 2),

                      // Estimated Delivery
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Est. Delivery Date',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            order.formattedDeliveryDate,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems / 2),

                      // Total Amount
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '\$${order.totalAmount.toStringAsFixed(2)}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: AColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Asizes.spaceBtwSections),

                // Action Buttons
                Column(
                  children: [
                    // Track Order Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(
                            () => OrderDetailsScreen(order: order),
                            transition: Transition.rightToLeft,
                          );
                        },
                        child: const Text('View Order Details'),
                      ),
                    ),
                    const SizedBox(height: Asizes.spaceBtwItems),

                    // Continue Shopping Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => Get.offAll(() => const NavigationMenu()),
                        child: const Text('Continue Shopping'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

