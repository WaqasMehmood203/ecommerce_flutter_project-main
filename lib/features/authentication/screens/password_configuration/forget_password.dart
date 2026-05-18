import 'package:flutter/material.dart';
import 'package:flutterproject/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Asizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //headings

            Text(
              ATexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: Asizes.spaceBtwItems,
            ),
            Text(
              ATexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: Asizes.spaceBtwSections * 2,
            ),

            //text feild

            TextFormField(
              decoration: const InputDecoration(
                labelText: ATexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),

            const SizedBox(
              height: Asizes.spaceBtwSections,
            ),

            //submit button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => const ResetPassword()),
                child: const Text(ATexts.submit),
              ),
            )
          ],
        ),
      ),
    );
  }
}
