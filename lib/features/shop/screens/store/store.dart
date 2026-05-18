import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/app_bar/tabbar.dart';
import 'package:flutterproject/common/widgets/brand/brandcard.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutterproject/common/widgets/layouts/grid_layout.dart';
import 'package:flutterproject/common/widgets/loaders/brands_shimmer.dart';
import 'package:flutterproject/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/features/shop/controllers/brand_controller.dart';
import 'package:flutterproject/features/shop/controllers/category_controller.dart';
import 'package:flutterproject/features/shop/screens/brand/all_brands.dart';
import 'package:flutterproject/common/widgets/empty_state/empty_state.dart';
import 'package:flutterproject/features/shop/screens/brand/brand_products.dart';
import 'package:flutterproject/features/shop/screens/search/search.dart';
import 'package:flutterproject/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categoryController = Get.put(CategoryController());
    final categories = categoryController.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [ACartCounterIcon()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: AHelperFunctions.isDarkMode(context)
                    ? AColors.black
                    : AColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(Asizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      //search bar
                      const SizedBox(height: Asizes.spaceBtwItems),
                      ASearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                        onTap: () => Get.to(() => SearchScreen()),
                      ),
                      const SizedBox(height: Asizes.spaceBtwSections),

                      // featured brands
                      ASectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems / 1.5),

                      //brands grid
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return ABrandsShimmer();
                        }

                        if (brandController.featuredBrands.isEmpty) {
                          return const AEmptyState(
                            title: 'No featured brands available',
                            subtitle: 'Check back later for fresh collections.',
                            animation: AImages.emptyAnimation,
                          );
                        }

                        return AGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brands =
                                brandController.featuredBrands[index];
                            return ABrandCard(
                              showBorder: true,
                              brand: brands,
                              onTap: () =>
                                  Get.to(() => BrandProducts(brand: brands)),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),

                //tabs
                bottom: ATabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => ACategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
