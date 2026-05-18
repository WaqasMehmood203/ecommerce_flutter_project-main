import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/brand/brandcard.dart';
import 'package:flutterproject/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:flutterproject/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutterproject/features/shop/controllers/brand_controller.dart';
import 'package:flutterproject/features/shop/models/brand_model.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: AAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Asizes.defaultSpace),
          child: Column(
            children: [
              // brand detail
              ABrandCard(
                showBorder: true,
                brand: brand,
              ),
              SizedBox(height: Asizes.spaceBtwItems),

              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, asyncSnapshot) {
                    const loader = AVerticalProductShimmer();
                    final widget = ACloudHelperFunctions.checkMultiRecordState(
                        snapshot: asyncSnapshot, loader: loader);
                    if (widget != null) return widget;

                    //record found
                    final brandProducts = asyncSnapshot.data!;

                    return ASortableProducts(
                      products: brandProducts,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
