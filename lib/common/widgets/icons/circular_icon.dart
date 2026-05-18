import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
// import 'package:iconsax/iconsax.dart';

class ACircularIcon extends StatelessWidget {
  // A custom circular icon widget with a background color.
  //
  //properties are :
  //container [width], [height], & [backgroundcolor].
  //
  //icons [size], [color], & [onpressed]

  const ACircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = Asizes.lg,
    required this.icon,
    this.color,
    this.baclgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? baclgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: baclgroundColor != null
            ? baclgroundColor!
            : AHelperFunctions.isDarkMode(context)
                // ignore: deprecated_member_use
                ? AColors.darkerGrey.withOpacity(0.7)
                // ignore: deprecated_member_use
                : AColors.grey.withOpacity(0.7),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon , color: color, size: size,)),
    );
  }
}
