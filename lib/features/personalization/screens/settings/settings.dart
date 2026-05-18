import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutterproject/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:flutterproject/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/data/repositories/authentication/authentication_repository.dart';
import 'package:flutterproject/features/authentication/screens/login/login.dart';
import 'package:flutterproject/features/personalization/screens/address/address.dart';
import 'package:flutterproject/features/personalization/screens/profile/profile.dart';
import 'package:flutterproject/features/shop/screens/order/order.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/utils/firestore_uploader.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository.instance);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            APrimaryHeaderContainer(
              child: Column(
                children: [
                  AAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AColors.white),
                    ),
                  ),
                  const SizedBox(
                    height: Asizes.spaceBtwSections,
                  ),

                  //user profile card

                  AUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(
                    height: Asizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            //body

            Padding(
              padding: EdgeInsets.all(Asizes.defaultSpace),
              child: Column(
                children: [
                  //account settings
                  ASectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: Asizes.spaceBtwItems,
                  ),

                  ASettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  ASettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout'),
                  ASettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(
                      () => const OrderScreen(),
                    ),
                  ),
                  ASettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account'),
                  ASettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons'),
                  ASettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message'),
                  ASettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: 'Manage data usage and connected accounts'),

                  //app settings

                  SizedBox(
                    height: Asizes.spaceBtwSections,
                  ),
                  ASectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: Asizes.spaceBtwItems,
                  ),
                  ASettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud Firebase',
                    trailing: IconButton(
                        onPressed: () async {
                          try {
                            await FirestoreUploader.seedAllSampleData();
                            ALoaders.successSnackBar(
                              title: 'Data uploaded',
                              message:
                                  'Sample categories, brands and products uploaded successfully.',
                            );
                          } catch (e) {
                            ALoaders.errorSnackBar(
                              title: 'Upload failed',
                              message: e.toString(),
                            );
                          }
                        },
                        icon: const Icon(Icons.upload)),
                  ),
                  ASettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  ASettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  ASettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  //logout button

                  const SizedBox(
                    height: Asizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        try {
                          await controller.logout();
                          Get.offAll(() => const LoginScreen());
                        } catch (e) {
                          Get.snackbar('Error', e.toString());
                        }
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(
                    height: Asizes.spaceBtwSections * 2.5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
