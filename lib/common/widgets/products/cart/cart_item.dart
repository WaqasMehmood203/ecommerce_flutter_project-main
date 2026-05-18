import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/images/a_rounded_image.dart';
import 'package:flutterproject/common/widgets/texts/a_brand_title_text_with_verified_icon.dart';
import 'package:flutterproject/common/widgets/texts/product_title_text.dart';
import 'package:flutterproject/features/shop/models/cart_item_model.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';

class ACartItem extends StatelessWidget {
  const ACartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image

        ARoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(Asizes.sm),
          backgroundColor: AHelperFunctions.isDarkMode(context)
              ? AColors.darkerGrey
              : AColors.light,
          isNetworkImage: true,
        ),
        const SizedBox(
          width: Asizes.spaceBtwItems,
        ),

        //title , price , and size

        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ABrandTitleTextWithVerifiedIcon(title: cartItem.brandName ?? ''),
            Flexible(
              child: AProductTitleText(
                title: cartItem.title,
                maxLines: 1,
              ),
            ),

            const SizedBox(
              height: Asizes.sm / 2,
            ),

            //attrinutes

            // Sale Price
            Text(
              cartItem.price.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
          ],
        )
      ],
    );
  }
}
