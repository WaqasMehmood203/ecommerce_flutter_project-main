// import 'package:flutter/material.dart';
// import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
// import 'package:flutterproject/features/personalization/controllers/address_controller.dart';
// import 'package:flutterproject/utils/constants/sizes.dart';
// import 'package:flutterproject/utils/validators/validation.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:iconsax/iconsax.dart';

// class AddNewAddressScreen extends StatelessWidget {
//   const AddNewAddressScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = AddressController.instace;

//     return Scaffold(
//       appBar:
//           AAppBar(showBackArrow: true, title: const Text('Add new Address')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(Asizes.defaultSpace),
//           child: Form(
//             key: controller.addressFormKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   controller: controller.name,
//                   validator: (value) =>
//                       AValidator.validateEmptyText('Name', value),
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Iconsax.user),
//                     labelText: 'Name',
//                   ),
//                 ),
//                 const SizedBox(height: Asizes.spaceBtwInputFeilds),
//                 TextFormField(
//                   controller: controller.phoneNumber,
//                   validator: AValidator.validatePhoneNumber,
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Iconsax.mobile),
//                     labelText: 'Phone Number',
//                   ),
//                 ),
//                 const SizedBox(height: Asizes.spaceBtwInputFeilds),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: controller.,
//                         validator: (value) =>
//                             AValidator.validateEmptyText('Name', value),
//                         decoration: const InputDecoration(
//                           prefixIcon: Icon(Iconsax.building_31),
//                           labelText: 'Street',
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: Asizes.spaceBtwInputFeilds),
//                     Expanded(
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           prefixIcon: Icon(Iconsax.code),
//                           labelText: 'Pincode',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: Asizes.spaceBtwInputFeilds),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Iconsax.global),
//                     labelText: 'City',
//                   ),
//                 ),
//                 const SizedBox(height: Asizes.defaultSpace),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text('Save'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/features/personalization/controllers/address_controller.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class AAddNewAddressScreen extends StatelessWidget {
  const AAddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar:
          const AAppBar(showBackArrow: true, title: Text("Add new Address")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        AValidator.validateEmptyText('Name', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                const SizedBox(height: Asizes.spaceBtwInputFeilds),
                TextFormField(
                    controller: controller.phoneNumber,
                    validator: AValidator.validatePhoneNumber,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Phone Number')),
                const SizedBox(height: Asizes.spaceBtwInputFeilds),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            controller: controller.street,
                            validator: (value) =>
                                AValidator.validateEmptyText('Street', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building_31),
                                labelText: 'Street'))),
                    const SizedBox(width: Asizes.spaceBtwInputFeilds),
                    Expanded(
                        child: TextFormField(
                            controller: controller.postalCode,
                            validator: (value) => AValidator.validateEmptyText(
                                'Postal Code', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.code),
                                labelText: 'Postal Code'))),
                  ],
                ),
                const SizedBox(height: Asizes.spaceBtwInputFeilds),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            controller: controller.city,
                            validator: (value) =>
                                AValidator.validateEmptyText('City', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building),
                                labelText: 'City'))),
                    const SizedBox(width: Asizes.spaceBtwInputFeilds),
                    Expanded(
                        child: TextFormField(
                            controller: controller.state,
                            validator: (value) =>
                                AValidator.validateEmptyText('State', value),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.activity),
                                labelText: 'State'))),
                  ],
                ),
                const SizedBox(height: Asizes.spaceBtwInputFeilds),
                TextFormField(
                    controller: controller.country,
                    validator: (value) =>
                        AValidator.validateEmptyText('Country', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global),
                        labelText: 'Country')),
                const SizedBox(height: Asizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: controller.addNewAddresses, child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
