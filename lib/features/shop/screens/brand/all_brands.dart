import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/brand/brandcard.dart';
import 'package:flutterproject/common/widgets/layouts/grid_layout.dart';
import 'package:flutterproject/common/widgets/loaders/brands_shimmer.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/features/shop/controllers/brand_controller.dart';
import 'package:flutterproject/features/shop/screens/brand/brand_products.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
        appBar: AAppBar(title: Text('Brand'), showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Asizes.defaultSpace),
            child: Column(
              children: [
                ///Heading
                ASectionHeading(title: 'Brands', showActionButton: false),
                SizedBox(height: Asizes.spaceBtwItems),

                ///-- Brands
                Obx(() {
                  if (brandController.isLoading.value) {
                    return ABrandsShimmer();
                  }

                  if (brandController.allBrands.isEmpty) {
                    return Center(
                      child: Text(
                        'No Data Found!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white),
                      ),
                    );
                  }

                  return AGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brands = brandController.allBrands[index];
                        return ABrandCard(
                          showBorder: true,
                          brand: brands,
                          onTap: () => Get.to(() => BrandProducts(
                                brand: brands,
                              )),
                        );
                      });
                })
              ],
            ),
          ),
        ));
  }
}
