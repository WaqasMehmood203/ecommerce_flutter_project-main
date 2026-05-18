import 'package:flutter/material.dart';
import 'package:flutterproject/features/authentication/controllers/login/login_controller.dart';
import 'package:flutterproject/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:flutterproject/features/authentication/screens/signup/signup.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:flutterproject/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ALoginForm extends StatelessWidget {
  const ALoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Asizes.spaceBtwSections),
        child: Column(
          children: [
            //email
            TextFormField(
              controller: controller.email,
              validator: (value) => AValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: ATexts.email),
            ),
            const SizedBox(height: Asizes.spaceBtwInputFeilds),
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
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),

            const SizedBox(height: Asizes.spaceBtwInputFeilds / 2),

            //remember me and forget password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me

                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          }),
                    ),
                    const Text(ATexts.rememberMe),
                  ],
                ),

                //forget password

                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(ATexts.forgetPassword),
                ),
              ],
            ),

            const SizedBox(height: Asizes.spaceBtwSections),

            //sign in button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(ATexts.signIn),
              ),
            ),

            const SizedBox(height: Asizes.spaceBtwItems),
            //create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: Text(ATexts.createAccount)),
            ),
            // const SizedBox(height: Asizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
