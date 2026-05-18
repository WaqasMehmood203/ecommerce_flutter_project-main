import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/login_signup/form_divider.dart';
import 'package:flutterproject/common/widgets/login_signup/social_buttons.dart';
import 'package:flutterproject/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
// import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  AImages.promoBanner5,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: Asizes.spaceBtwItems),
              Text(
                ATexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //form

              ASignupForm(dark: dark),

              const SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //divider

              AFormDivider(
                  dark: dark, dividerText: ATexts.orSignUpWith.capitalize!),

              const SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //social buttons

              const ASocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
