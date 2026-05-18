import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/empty_state/empty_state.dart';
import 'package:flutterproject/common/widgets/loaders/animation_loader.dart';
import 'package:flutterproject/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutterproject/features/shop/controllers/product/search_controller.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductSearchController());
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AAppBar(
        showBackArrow: true,
        title: Text('Search Store', style: theme.textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Asizes.defaultSpace),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: controller.searchProducts,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search products, brands or categories',
                prefixIcon: const Icon(Iconsax.search_normal),
                suffixIcon: Obx(
                  () => controller.query.value.isEmpty
                      ? const SizedBox.shrink()
                      : IconButton(
                          onPressed: () {
                            _searchController.clear();
                            controller.clearSearch();
                          },
                          icon: const Icon(Iconsax.close_circle),
                        ),
                ),
              ),
            ),
            const SizedBox(height: Asizes.spaceBtwSections),
            Expanded(
              child: Obx(() {
                if (controller.query.value.isEmpty) {
                  return const AEmptyState(
                    title: 'Search the store',
                    subtitle: 'Find products, brands and categories instantly.',
                    animation: AImages.searchAnimation,
                    buttonText: 'Browse Collections',
                    onButtonPressed: null,
                  );
                }

                if (controller.isSearching.value) {
                  return const AAnimationLoaderWidget(
                    text: 'Finding products...',
                    animation: AImages.searchAnimation,
                  );
                }

                if (controller.products.isEmpty) {
                  return const AEmptyState(
                    title: 'No results found',
                    subtitle: 'Try another keyword or browse the catalog.',
                    animation: AImages.emptyAnimation,
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(top: Asizes.spaceBtwItems),
                  child: ASortableProducts(
                    products: controller.products.toList(),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
