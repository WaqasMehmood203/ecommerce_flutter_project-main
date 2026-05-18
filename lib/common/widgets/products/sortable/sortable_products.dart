import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/layouts/grid_layout.dart';
import 'package:flutterproject/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutterproject/features/shop/controllers/all_products_controller.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// is widget ko Common Folder  me ja kr widgets me ja kr Products ky folder me sortable me ja kr sortable_products.dart me ja kr Refactor ka code waha rkh dena ha.
class ASortableProducts extends StatelessWidget {
  const ASortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products); // Populate the controller's list

    return Column(
      children: [
        // Dropdown for sorting options
        Obx(
          () => DropdownButtonFormField<String>(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            initialValue: controller.selectedSortOption.value,
            onChanged: (value) {
              if (value != null) {
                controller.sortProducts(value); // Trigger sorting
              }
            },
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity',
            ]
                .map(
                  (option) =>
                      DropdownMenuItem(value: option, child: Text(option)),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: Asizes.spaceBtwSections),

        // Display sorted products in grid layout
        Obx(
          () => AGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (__, index) =>
                AProductCardVertical(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}
