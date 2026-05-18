import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/features/personalization/controllers/address_controller.dart';
import 'package:flutterproject/features/personalization/screens/address/add_new_address.dart';
import 'package:flutterproject/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AColors.primary,
        onPressed: () => Get.to(() => const AAddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: AColors.white),
      ),
      appBar: AAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Asizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(

                // use key to trigger refresh
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, asyncSnapshot) {
                  final response = ACloudHelperFunctions.checkMultiRecordState(
                      snapshot: asyncSnapshot);
                  if (response != null) return response;
                  final addresses = asyncSnapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (_, index) => ASingleAddress(
                            address: addresses[index],
                            onTap: () {
                              controller.selectAddress(addresses[index]);
                            },
                          ));
                }),
          ),
        ),
      ),
    );
  }
}
