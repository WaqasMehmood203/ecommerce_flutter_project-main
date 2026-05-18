import 'package:flutter/material.dart';
// import 'package:flutterproject/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutterproject/common/widgets/texts/a_brand_title_text.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:flutterproject/utils/constants/text_strings.dart';

class ABrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const ABrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = AColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ABrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizes: brandTextSizes,
          ),
        ),
        const SizedBox(
          width: Asizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: Asizes.iconXs,
        ),
      ],
    );
  }
}
