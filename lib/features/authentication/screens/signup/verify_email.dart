import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/data/repositories/authentication/authentication_repository.dart';
import 'package:flutterproject/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      // The close icon in the app bar is used to log out the user and redirect them to the login screen.
      // This approach is taken to handle scenarios where the user enters the registration process,
      // and the data is stored. Upon reopening the app, it checks if the email is verified.
      //If not verified, the app always navigates to the verification screen.

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //padding to give default equal space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: Column(
            children: [
              //image
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  AImages.promoBanner6,
                  width: AHelperFunctions.screenWidth() * 0.92,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //title & subtitle
              Text(
                ATexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Asizes.spaceBtwItems,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Asizes.spaceBtwItems,
              ),
              Text(
                ATexts.confirmEmailSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //buttons

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.checkEmailVerificationStatus();
                  },
                  child: const Text(ATexts.tContinue),
                ),
              ),
              const SizedBox(
                height: Asizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    await controller.sendEmailVerification();
                  },
                  child: const Text(ATexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
