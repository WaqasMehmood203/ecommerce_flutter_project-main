import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/data/repositories/authentication/authentication_repository.dart';
import 'package:flutterproject/features/personalization/controllers/user_controller.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/netowrk/network_manager.dart';
import 'package:flutterproject/utils/popup/full_screen_loader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutterproject/features/admin/screens/admin_navigation_menu.dart';

class LoginController extends GetxController {
  // variable

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// Email and password login

  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      AFullScreenLoader.openLoadingDialog(
          'Logging You in', AImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AFullScreenLoader.stopLoading();
        return;
      }

      //form validation

      if (!loginFormKey.currentState!.validate()) {
        AFullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Hardcoded admin login (bypass Firebase)
      if (email.text.trim() == '2304.a.rehman@gmail.com' &&
          password.text.trim() == 'Admin@123') {
        AFullScreenLoader.stopLoading();
        Get.offAll(() => const AdminNavigationMenu());
        return;
      }
      //login user using email and password authentication

      // ignore: unused_local_variable
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //remove loader
      AFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ALoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// google signin authentication
  ///
  Future<void> googleSignIn() async {
    try {
      //start loading
      AFullScreenLoader.openLoadingDialog(
          'Logging you in', AImages.docerAnimation);

      // check internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AFullScreenLoader.stopLoading();
        return;
      }

      //google authentication

      final userCredetials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredetials);

      //remove loader
      AFullScreenLoader.stopLoading();

      //redirct user

      AuthenticationRepository.instance.screenRedirect();
    }
    //  catch (e) {
    //   AFullScreenLoader.stopLoading();
    //   ALoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    // }
    catch (e) {
      AFullScreenLoader.stopLoading();
      ALoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
