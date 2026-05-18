import 'package:flutter/material.dart';
import 'package:flutterproject/common/styles/spacing_styles.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  bool get _isLottie => image.toLowerCase().endsWith('.json');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ASpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //image

              _isLottie
                  ? Lottie.asset(
                      image,
                      width: AHelperFunctions.screenWidth() * 0.6,
                      repeat: false,
                    )
                  : Image(
                      image: AssetImage(image),
                      width: AHelperFunctions.screenWidth() * 0.6,
                    ),
              const SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //title & subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Asizes.spaceBtwItems,
              ),

              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Asizes.spaceBtwSections,
              ),

              //button

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text(ATexts.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
