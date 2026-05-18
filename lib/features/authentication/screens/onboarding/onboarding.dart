import 'package:flutter/material.dart';
import 'package:flutterproject/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutterproject/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:flutterproject/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:flutterproject/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:flutterproject/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingWidget(
                image: AImages.onBoardingImage1,
                title: ATexts.onBoardingTitle1,
                subTitle: ATexts.onBoardingSubTitle1,
              ),
              OnBoardingWidget(
                image: AImages.onBoardingImage2,
                title: ATexts.onBoardingTitle2,
                subTitle: ATexts.onBoardingSubTitle2,
              ),
              OnBoardingWidget(
                image: AImages.onBoardingImage3,
                title: ATexts.onBoardingTitle3,
                subTitle: ATexts.onBoardingSubTitle3,
              ),
            ],
          ),

          //skip button

          const OnBoardingSkip(),

          //dot navigation smoothpageindicator

          const onBoardingDotNavigation(),

          //circular button

          const onBoardingNextButton(),
        ],
      ),
    );
  }
}
