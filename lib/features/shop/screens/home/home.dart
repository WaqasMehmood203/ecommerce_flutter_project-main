import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutterproject/common/widgets/empty_state/empty_state.dart';
import 'package:flutterproject/common/widgets/layouts/grid_layout.dart';
import 'package:flutterproject/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/features/shop/controllers/product/product_controller.dart';
import 'package:flutterproject/features/shop/screens/all_products/all_products.dart';
import 'package:flutterproject/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutterproject/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flutterproject/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutterproject/features/shop/screens/search/search.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            APrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  const AHomeAppBar(),
                  const SizedBox(height: Asizes.spaceBtwSections),

                  //search bar
                  ASearchContainer(
                    text: 'Search in Store',
                    onTap: () => Get.to(() => SearchScreen()),
                  ),

                  const SizedBox(height: Asizes.spaceBtwSections),

                  //categories
                  Padding(
                    padding: EdgeInsets.only(left: Asizes.defaultSpace),
                    child: Column(
                      children: [
                        //heading
                        ASectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: Asizes.spaceBtwItems),

                        //categories
                        AHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: Asizes.spaceBtwSections),
                ],
              ),
            ),

            //body (white part)
            Padding(
              padding: const EdgeInsets.all(Asizes.defaultSpace),
              child: Column(
                children: [
                  //promo slider
                  APromoSlider(
                    banners: [
                      AImages.promoBanner4,
                      AImages.promoBanner7,
                      AImages.promoBanner2,
                      AImages.promoBanner1,
                      AImages.promoBanner8,
                      AImages.promoBanner5,
                      AImages.promoBanner6,
                      AImages.promoBanner3,
                    ],
                  ),

                  const SizedBox(height: Asizes.spaceBtwSections),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF1F2937),
                          Color(0xFF111827),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Asizes.defaultSpace),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'E-Store Exclusive',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: Asizes.spaceBtwItems),
                                Text(
                                  'Shop trending fashion, gadgets and home essentials in one modern storefront.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.white70,
                                      ),
                                ),
                                const SizedBox(height: Asizes.spaceBtwItems),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFF8A00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Shop Now'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: Asizes.spaceBtwItems),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AImages.promoBanner2,
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: Asizes.spaceBtwSections),

                  ASectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(
                      () => AllProducts(
                        title: 'Popular Products',
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  SizedBox(height: Asizes.spaceBtwItems),

                  // popular products
                  Obx(() {
                    if (controller.isLoading.value) {
                      return AHomeAppBar();
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return const AEmptyState(
                        title: 'No featured products yet',
                        subtitle:
                            'Our team is curating the best offers for you.',
                        animation: AImages.emptyAnimation,
                      );
                    }
                    return AGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => AProductCardVertical(
                        product: controller.featuredProducts[index],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
