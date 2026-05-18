import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/loaders/circular_loader.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/common/widgets/texts/section_heading.dart';
import 'package:flutterproject/data/repositories/address/address_repository.dart';
import 'package:flutterproject/features/personalization/models/address_model.dart';
import 'package:flutterproject/features/personalization/screens/address/add_new_address.dart';
import 'package:flutterproject/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/cloud_helper_functions.dart';
import 'package:flutterproject/utils/netowrk/network_manager.dart';
import 'package:flutterproject/utils/popup/full_screen_loader.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  RxBool refreshData = true.obs;

  // //Fetch all user specific addresses
  // Future<List<AddressModel>> getAllUserAddresses() async {
  //   try {
  //     final addresses = await addressRepository.fetchUserAddresses();
  //     selectedAddress.value = addresses.firstWhere(
  //         (element) => element.selectedAddress,
  //         orElse: () => AddressModel.empty());
  //     return addresses;
  //   } catch (e) {
  //     ALoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //     return [];
  //   }
  // }

  //Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();

      // Check if there are any addresses
      if (addresses.isNotEmpty) {
        // Try to find a selected address
        final foundSelectedAddress = addresses.firstWhereOrNull(
            (element) => element.selectedAddress); // Use firstWhereOrNull

        // If a selected address is found, use it. Otherwise, select the first address.
        // If no address is marked as selected, we should default to the first one,
        // or handle the case where no addresses exist yet.
        if (foundSelectedAddress != null) {
          selectedAddress.value = foundSelectedAddress;
        } else {
          // If no address is selected, you might want to automatically select the first one,
          // or leave selectedAddress as empty if that's a valid state for your UI.
          // For now, let's assume we want to select the first one if none are marked.
          selectedAddress.value = addresses.first;
          // You might also want to update this in the database to mark it as selected
          await addressRepository.updateSingleField(addresses.first.id, true);
        }
      } else {
        // If no addresses exist, ensure selectedAddress is empty
        selectedAddress.value = AddressModel.empty();
      }

      return addresses;
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const ACircularLoader(),
      );
      // clear the ' selected ' feild

      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSingleField(
            selectedAddress.value.id, false);
      }

      // assign selected address

      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      //set the selected field to true for the newly selected address
      await addressRepository.updateSingleField(selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // add new address
  Future addNewAddresses() async {
    try {
      //start loading
      AFullScreenLoader.openLoadingDialog(
          'Storing Address...', AImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AFullScreenLoader.stopLoading();
        return;
      }

      //Form validation

      if (!addressFormKey.currentState!.validate()) {
        AFullScreenLoader.stopLoading();
        return;
      }

      // save address data

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        state: state.text.trim(),
        city: city.text.trim(),
        country: country.text.trim(),
        postalCode: postalCode.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepository.addAddress(address);

      //update selected address states

      address.id = id;
      await selectAddress(address);

      // remove loader
      AFullScreenLoader.stopLoading();

      //show success message
      ALoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully');
      // refresh addresses data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      //Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // remove loader
      AFullScreenLoader.stopLoading();
      ALoaders.errorSnackBar(
          title: 'Address not found !', message: e.toString());
    }
  }

  // show addresses ModalBottomSheet at checkout

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(Asizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ASectionHeading(title: 'Select Address'),
              SizedBox(
                height: Asizes.defaultSpace,
              ),
              FutureBuilder(
                future: getAllUserAddresses(),
                builder: (_, snapshot) {
                  // helper functions: Hanlde loader, No record or error messages
                  final response = ACloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (response != null) return response;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => ASingleAddress(
                      address: snapshot.data![index],
                      onTap: () async {
                        await selectAddress(snapshot.data![index]);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: Asizes.defaultSpace * 2,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(
                    () => const AAddNewAddressScreen(),
                  ),
                  child: const Text('Add New Address'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // function to reset form feild

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    state.clear();
    city.clear();
    country.clear();
    postalCode.clear();
    addressFormKey.currentState?.reset();
  }
}
