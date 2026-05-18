import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/device/device_utility.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';

class ATabBar extends StatelessWidget implements PreferredSizeWidget {
  //if you want to add the background color to tabs you have to wrap them in material widget.
  // to do that we need [prefferedsuze] widget and that's why created custom class [prefferedsizewidget]
  const ATabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? AColors.black : AColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AColors.primary,
        labelColor: dark ? AColors.white : AColors.primary,
        unselectedLabelColor: AColors.darkGrey,
      ),
    );
  }

  @override
  // 
  Size get preferredSize => Size.fromHeight(ADeviceUtils.getAppBarHeight());
}
