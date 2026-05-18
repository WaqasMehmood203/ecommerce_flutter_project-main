import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/loaders/shimmer.dart';
import 'package:flutterproject/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutterproject/features/personalization/controllers/user_controller.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class AHomeAppBar extends StatelessWidget {
  const AHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return AAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ATexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const AShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: AColors.white),
              );
            }
          }),
        ],
      ),
      actions: [
        ACartCounterIcon(
          iconColor: AColors.white,
        )
      ],
    );
  }
}
