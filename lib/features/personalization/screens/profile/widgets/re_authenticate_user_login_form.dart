import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/features/personalization/controllers/user_controller.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:flutterproject/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUserLoginForm extends StatelessWidget {
  const ReAuthenticateUserLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AAppBar(
        showBackArrow: true,
        title: Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.reAuthFormKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Asizes.spaceBtwSections),
            child: Column(
              children: [
                //email
                TextFormField(
                  controller: controller.verifyEmail,
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
                    controller: controller.verifypassword,
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

                const SizedBox(height: Asizes.spaceBtwSections),

                //sign in button

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthenticateEmailAndPassword(),
                    child: Text('Verify'),
                  ),
                ),
                // const SizedBox(height: Asizes.spaceBtwSections),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
