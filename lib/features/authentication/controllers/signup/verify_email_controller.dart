import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/common/widgets/success_screen/success_screen.dart';
import 'package:flutterproject/data/repositories/authentication/authentication_repository.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  Timer? _redirectTimer;
  Timer? _resendCooldownTimer;
  final RxBool canResendEmail = true.obs;
  final RxInt resendSecondsLeft = 0.obs;

  //send email whenever verify email screen appers and set timer for auto redirect

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  @override
  void onClose() {
    _redirectTimer?.cancel();
    _resendCooldownTimer?.cancel();
    super.onClose();
  }

  /// send email verification link
  Future<void> sendEmailVerification() async {
    if (!canResendEmail.value) {
      ALoaders.warningSnackBar(
        title: 'Please wait',
        message: 'Try again in ${resendSecondsLeft.value}s.',
      );
      return;
    }

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ALoaders.errorSnackBar(
          title: 'Session expired',
          message: 'Please log in again and request verification email.',
        );
        return;
      }

      await AuthenticationRepository.instance.sendEmailVerification();
      ALoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email. ');
      _startResendCooldown();
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    }
  }

  void _startResendCooldown() {
    _resendCooldownTimer?.cancel();
    canResendEmail.value = false;
    resendSecondsLeft.value = 30;

    _resendCooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSecondsLeft.value <= 1) {
        timer.cancel();
        resendSecondsLeft.value = 0;
        canResendEmail.value = true;
      } else {
        resendSecondsLeft.value--;
      }
    });
  }

  /// timer to automatically redirect on email verification
  void setTimerForAutoRedirect() {
    _redirectTimer?.cancel();
    _redirectTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        final user = FirebaseAuth.instance.currentUser;
        await user?.reload();
        final refreshedUser = FirebaseAuth.instance.currentUser;
        if (refreshedUser?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: AImages.successAnimation,
              title: ATexts.yourAccountCreatedTitle,
              subTitle: ATexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  /// manually check if email verified
  ///
  Future<void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();
    final refreshedUser = FirebaseAuth.instance.currentUser;

    if (refreshedUser != null && refreshedUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: AImages.successfullyRegisterAnimation,
          title: ATexts.yourAccountCreatedTitle,
          subTitle: ATexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
      return;
    }

    ALoaders.warningSnackBar(
      title: 'Email not verified',
      message: 'Please open your inbox, verify your email, then tap Continue.',
    );
  }
}
