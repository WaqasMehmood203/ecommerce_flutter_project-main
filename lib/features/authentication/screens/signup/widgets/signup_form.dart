import 'package:flutter/material.dart';
import 'package:flutterproject/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutterproject/features/authentication/screens/signup/widgets/terms_and_condition_checkbox.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:flutterproject/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ASignupForm extends StatelessWidget {
  const ASignupForm({
    super.key,
    required bool dark,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = AHelperFunctions.isDarkMode(context);

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      AValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: ATexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: Asizes.spaceBtwInputFeilds,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      AValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: ATexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: Asizes.spaceBtwInputFeilds,
          ),

          //user name

          TextFormField(
            controller: controller.username,
            validator: (value) =>
                AValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: ATexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(
            height: Asizes.spaceBtwInputFeilds,
          ),

          //email

          TextFormField(
            controller: controller.email,
            validator: (value) => AValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: ATexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),

          const SizedBox(
            height: Asizes.spaceBtwInputFeilds,
          ),

          //phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => AValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: ATexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(
            height: Asizes.spaceBtwInputFeilds,
          ),

          //password

          Obx(
            () => TextFormField(
              // expands: false,
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              validator: (value) => AValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: ATexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: Asizes.spaceBtwInputFeilds,
          ),

          //Terms and conditions checkbox

          ATermsAndConditionsCheckbox(dark: dark),

          const SizedBox(
            height: Asizes.spaceBtwSections,
          ),

          //sign up button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(ATexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

