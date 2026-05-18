import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/images/a_circular_image.dart';
import 'package:flutterproject/features/personalization/controllers/user_controller.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class AUserProfileTile extends StatelessWidget {
  const AUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: ACircularImage(
        image: AImages.user,
        width: 50,
        height: 50,
        padding: 0, isNetworkImage: false,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: AColors.white,
            ),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context).textTheme.labelMedium!.apply(
              color: AColors.white,
            ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Iconsax.edit,
          color: AColors.white,
        ),
      ),
    );
  }
}
