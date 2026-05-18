import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:flutterproject/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutterproject/features/shop/controllers/all_products_controller.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: AAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, asyncSnapshot) {
                // check the state of the futurebuilder snapshot
                const loader = AVerticalProductShimmer();

                final widget = ACloudHelperFunctions.checkMultiRecordState(
                    snapshot: asyncSnapshot, loader: loader);

                // return appropriate widget based on snapshot state
                if (widget != null) return widget;

                //products found
                final products = asyncSnapshot.data!;

                return ASortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
