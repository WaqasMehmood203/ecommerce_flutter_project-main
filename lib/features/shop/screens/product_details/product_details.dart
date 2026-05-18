import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/features/shop/screens/checkout/checkout.dart';
import 'package:flutterproject/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:flutterproject/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:flutterproject/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutterproject/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:flutterproject/features/shop/controllers/product/cart_controller.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: ABottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //1 - product image slider
            AProductImageSlider(
              dark: dark,
              product: product,
            ),
            //2- product details
            Padding(
              padding: EdgeInsets.only(
                  right: Asizes.defaultSpace,
                  left: Asizes.defaultSpace,
                  bottom: Asizes.defaultSpace),
              child: Column(
                children: [
                  //rating and share button
                  ARatingAndShare(),

                  //price , title , stock , and brand

                  AProductMetaData(
                    product: product,
                  ),

                  //Attributes
                  const SizedBox(
                    height: Asizes.spaceBtwItems,
                  ),

                  //checkout button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final controller = CartController.instance;
                        int currentQuantity = controller.productQuantityInCart.value;
                        if (currentQuantity < 1) currentQuantity = 1;
                        final cartItem = controller.convertToCartItem(product, currentQuantity);
                        if (cartItem != null) {
                          int index = controller.cartItems.indexWhere((item) => item.productId == cartItem.productId);
                          if (index < 0) {
                            controller.addOneToCart(cartItem);
                          } else {
                            controller.cartItems[index].quantity = currentQuantity;
                            controller.updateCart();
                          }
                        }
                        Get.to(() => const CheckoutScreen());
                      },
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: Asizes.spaceBtwSections,
                  ),

                  //description

                  const ASectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: Asizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //reviews
                  const Divider(),
                  const SizedBox(
                    height: Asizes.spaceBtwItems,
                  ),
                  Row(
                    children: [
                      ASectionHeading(
                        title: 'Reviews (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Asizes.spaceBtwItems,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
