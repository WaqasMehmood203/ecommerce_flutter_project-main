import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/images/a_circular_image.dart';
import 'package:flutterproject/common/widgets/loaders/shimmer.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/features/personalization/controllers/user_controller.dart';
import 'package:flutterproject/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const AAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      //body

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    //profile picture
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : AImages.user;
                      return controller.imageUploading.value
                          ? const AShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : ACircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                      onPressed: controller.uploadUserProfilePicture,
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: Asizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: Asizes.spaceBtwItems,
              ),

              //Heading profile info

              const ASectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: Asizes.spaceBtwItems,
              ),

              AProfileMenu(
                  onPressed: () {},
                  title: 'Name',
                  value: controller.user.value.fullName),
              AProfileMenu(
                  onPressed: () {},
                  title: 'Username',
                  value: controller.user.value.username),

              const SizedBox(
                height: Asizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: Asizes.spaceBtwItems,
              ),

              // Heading personal info

              const ASectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: Asizes.spaceBtwItems,
              ),

              AProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              AProfileMenu(
                onPressed: () {},
                value: controller.user.value.email,
                title: 'Email',
              ),
              AProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
              ),
              AProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              AProfileMenu(
                onPressed: () {},
                title: 'Date Of Birth',
                value: '10-Oct, 1994',
              ),

              const Divider(),
              const SizedBox(
                height: Asizes.spaceBtwItems,
              ),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
