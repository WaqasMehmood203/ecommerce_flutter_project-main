import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';

class OrderItemsWidget extends StatelessWidget {
  const OrderItemsWidget({super.key, required this.order});

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
          Text(
            'Ordered Products',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: Asizes.spaceBtwItems),
          const Divider(),
          const SizedBox(height: Asizes.spaceBtwItems),
          ...order.items.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final item = entry.value;
              return Column(
                children: [
                  Row(
                    children: [
                      // Product Image
                      Container(
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(Asizes.sm),
                        decoration: BoxDecoration(
                          color: dark ? AColors.dark : AColors.light,
                          borderRadius:
                              BorderRadius.circular(Asizes.cardRadiusMd),
                        ),
                        child: Image.network(
                          item.image != null && item.image!.isNotEmpty
                              ? item.image!
                              : 'https://via.placeholder.com/80',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.image_not_supported,
                            color: dark ? AColors.white : AColors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: Asizes.spaceBtwItems),
                      // Product Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: Asizes.spaceBtwItems / 2),
                            Text(
                              'Qty: ${item.quantity}',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      // Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AColors.primary,
                                ),
                          ),
                          Text(
                            '\$${item.price.toStringAsFixed(2)} each',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (index < order.items.length - 1)
                    const Divider(height: Asizes.spaceBtwItems),
                  if (index < order.items.length - 1)
                    const SizedBox(height: Asizes.spaceBtwItems),
                ],
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
