import 'package:flutter/material.dart';
import 'package:flutterproject/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class ATermsAndConditionsCheckbox extends StatelessWidget {
  const ATermsAndConditionsCheckbox({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          child: Obx(
            () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value),
          ),
        ),
        const SizedBox(
          width: Asizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${ATexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: '${ATexts.privacyPolicy}  ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? AColors.white : AColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? AColors.white : AColors.primary,
                      ),
                ),
                TextSpan(
                    text: '${ATexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: ATexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? AColors.white : AColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? AColors.white : AColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
