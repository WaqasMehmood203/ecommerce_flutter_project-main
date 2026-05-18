import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterproject/common/widgets/images/a_circular_image.dart';
import 'package:flutterproject/common/widgets/texts/a_brand_title_text_with_verified_icon.dart';
import 'package:flutterproject/common/widgets/texts/product_price_text.dart';
import 'package:flutterproject/common/widgets/texts/product_title_text.dart';
import 'package:flutterproject/features/shop/controllers/product/product_controller.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/utils/constants/sizes.dart';

class AProductMetaData extends StatelessWidget {
  const AProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //priceand sale price
        Row(
          children: [
            //sale tag

            ARoundedContainer(
              width: 48,
              height: 25,
              radius: Asizes.sm,
              // ignore: deprecated_member_use
              backgroundColor: AColors.secondary.withOpacity(0.4),
              padding: const EdgeInsets.symmetric(
                  horizontal: Asizes.xs, vertical: Asizes.xs),
              child: Center(
                child: AProductPriceText(
                  price: '$salePercentage%',
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: Asizes.spaceBtwItems,
            ),

            //price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),

            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(
                width: Asizes.spaceBtwItems,
              ),
            AProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: Asizes.spaceBtwItems / 1.5,
        ),

        //title

        AProductTitleText(title: product.title),
        const SizedBox(
          height: Asizes.spaceBtwItems / 1.5,
        ),

        //stock status

        Row(
          children: [
            AProductTitleText(title: 'Status'),
            const SizedBox(
              width: Asizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        SizedBox(
          height: Asizes.spaceBtwItems / 1.5,
        ),

        //brand

        Row(
          children: [
            ACircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 45,
              height: 45,
              // overlayColor: dark ? AColors.white : AColors.black,
              isNetworkImage: true,
            ),
            SizedBox(
              width: Asizes.spaceBtwItems,
            ),
            ABrandTitleTextWithVerifiedIcon(
              title: product.brand!.name,
              brandTextSizes: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
