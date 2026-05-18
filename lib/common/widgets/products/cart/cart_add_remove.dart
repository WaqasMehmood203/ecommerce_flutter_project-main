import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/icons/circular_icon.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class AProductQuantityWithAddAndRemove extends StatelessWidget {
  const AProductQuantityWithAddAndRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    // return Row(
    // children: [
    // const SizedBox(
    //   width: 70,
    // ),
    //add remove buttons
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ACircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: Asizes.md,
          color: AColors.white,
          baclgroundColor: AHelperFunctions.isDarkMode(context)
              ? AColors.darkerGrey
              : AColors.black,
          onPressed: remove,
        ),
        SizedBox(
          width: Asizes.spaceBtwItems,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          width: Asizes.spaceBtwItems,
        ),
        ACircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: Asizes.md,
          color: AColors.white,
          baclgroundColor: AColors.primary,
          onPressed: add,
        ),
      ],
    );
    // ],
    // );
  }
}
