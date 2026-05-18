import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/device/device_utility.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:flutterproject/features/personalization/controllers/theme_controller.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    final themeController = Get.put(ThemeController());
    final themeToggle = Obx(() {
      final isDark = themeController.themeMode.value == ThemeMode.dark;
      return IconButton(
        onPressed: () => themeController.toggleTheme(),
        icon: Icon(isDark ? Icons.nightlight_round : Icons.wb_sunny),
        color: isDark ? AColors.white : AColors.dark,
      );
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Asizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                icon: Icon(
                  Iconsax.arrow_left,
                  color: dark ? AColors.white : AColors.dark,
                ))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(leadingIcon),
                  )
                : null,
        title: title,
        actions: [
          ...?actions,
          themeToggle,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ADeviceUtils.getAppBarHeight());
}
