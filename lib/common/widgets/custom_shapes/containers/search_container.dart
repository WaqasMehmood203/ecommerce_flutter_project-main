import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/device/device_utility.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
// import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ASearchContainer extends StatelessWidget {
  const ASearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: Asizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: ADeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(Asizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? AColors.dark
                    : AColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(Asizes.cardRadiusLg),
            border: showBorder
                ? Border.all(color: dark ? AColors.dark : AColors.light)
                : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: AColors.darkerGrey,
              ),
              const SizedBox(
                width: Asizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
