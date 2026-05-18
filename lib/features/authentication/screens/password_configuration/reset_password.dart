import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: Column(
            children: [
              //image

              Image(
                image: const AssetImage(
                    "assets/images/login_images/deliveredEmailIlustration.webp"),
                width: AHelperFunctions.screenWidth() * 0.6,
              ),
              SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //title & subtitle
              Text(
                ATexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: Asizes.spaceBtwItems,
              ),

              Text(
                ATexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //button

              SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(onPressed: () {}, child: Text(ATexts.done)),
              ),

              SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //resend email


              SizedBox(
                width: double.infinity,
                child:
                    TextButton(onPressed: () {}, child: Text(ATexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
