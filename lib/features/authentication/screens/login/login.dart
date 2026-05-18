import 'package:flutter/material.dart';
import 'package:flutterproject/common/styles/spacing_styles.dart';
import 'package:flutterproject/common/widgets/login_signup/form_divider.dart';
import 'package:flutterproject/common/widgets/login_signup/social_buttons.dart';
import 'package:flutterproject/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutterproject/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ASpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo, title and subtitle
              ALoginHeader(dark: dark),

              const ALoginForm(),

              //divider
              AFormDivider(
                dark: dark,
                dividerText: ATexts.orSignInWith.capitalize!,
              ),

              const SizedBox(height: Asizes.spaceBtwSections),

              //footer

              const ASocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
