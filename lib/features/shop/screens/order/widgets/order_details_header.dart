import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class OrderDetailsHeader extends StatelessWidget {
  const OrderDetailsHeader({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);

    return ARoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(Asizes.md),
      backgroundColor: dark ? AColors.black : AColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID & Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: Asizes.spaceBtwItems / 2),
                  Text(
                    '#${order.formattedOrderId}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Asizes.md,
                  vertical: Asizes.sm,
                ),
                decoration: BoxDecoration(
                  color: order.status == order.status
                      ? AColors.primary.withOpacity(0.2)
                      : AColors.warning.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Asizes.borderRadiusSm),
                ),
                child: Text(
                  order.orderStatusText,
                  style:
                      Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: order.status.toString().contains('delivered')
                                ? AColors.success
                                : AColors.warning,
                            fontWeight: FontWeight.bold,
                          ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Asizes.spaceBtwItems),
          const Divider(),
          const SizedBox(height: Asizes.spaceBtwItems),
          // Order Date
          Row(
            children: [
              Icon(Iconsax.calendar, size: Asizes.iconMd),
              const SizedBox(width: Asizes.spaceBtwItems / 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Date',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    order.formattedOrderDate,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: Asizes.spaceBtwItems),
          // Delivery Date
          Row(
            children: [
              Icon(Iconsax.truck, size: Asizes.iconMd),
              const SizedBox(width: Asizes.spaceBtwItems / 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimated Delivery',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    order.formattedDeliveryDate.isNotEmpty
                        ? order.formattedDeliveryDate
                        : 'Not yet shipped',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
