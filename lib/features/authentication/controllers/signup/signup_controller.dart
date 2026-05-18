import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/data/repositories/authentication/authentication_repository.dart';
import 'package:flutterproject/data/repositories/user/user_repository.dart';
import 'package:flutterproject/features/authentication/models/user_model.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/features/authentication/screens/signup/verify_email.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/netowrk/network_manager.dart';
import 'package:flutterproject/utils/popup/full_screen_loader.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs; // observable for hiding/showing passowrd
  final privacyPolicy = true.obs; // observable for privacy policy acceptance
  final email = TextEditingController(); //controller for email input
  final lastName = TextEditingController(); //controller for last name input
  final username = TextEditingController(); //controller for username input
  final password = TextEditingController(); //controller for password input
  final firstName = TextEditingController(); //controller for first name input
  final phoneNumber =
      TextEditingController(); //controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key for form validation
  //signup

  void signup() async {
    try {
      //start loading

      AFullScreenLoader.openLoadingDialog(
        "We are processing your information. . .",
        AImages.docerAnimation,
      );

      //check internet connectivity

      // final isConnected = await NetworkManager.instance.isConnected();

      // if (!isConnected) {
      // AFullScreenLoader.stopLoading();

      //   return;
      // }

      final isConnected = await NetworkManager.instance.isConnected().timeout(
            Duration(seconds: 5),
            onTimeout: () => false,
          );
      if (!isConnected) {
        AFullScreenLoader.stopLoading();
        ALoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your connection and try again.',
        );
        return;
      }

      //form validation

      if (!signupFormKey.currentState!.validate()) {
        AFullScreenLoader.stopLoading();

        return;
      }

      //privacy policy check

      if (!privacyPolicy.value) {
        ALoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In Order to create account, You must have to read and accept the privacy policy & Terms of use.',
        );

        return;
      }

      //register user in the firebase authentication and save user data in the firestore

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated user data in the firebase firestore

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        role: UserRole.user,
      );

      //remove loader
      AFullScreenLoader.stopLoading();

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Send verification email right after account creation.
      await AuthenticationRepository.instance.sendEmailVerification();

      //show success message

      ALoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your acocunt has been created! Verify email to continue. ',
      );

      //Move to verify email screen

      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //remove loader
      AFullScreenLoader.stopLoading();

      //show some generic error to the user
      ALoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
