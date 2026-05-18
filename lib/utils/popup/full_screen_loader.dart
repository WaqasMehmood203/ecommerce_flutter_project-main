import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/loaders/animation_loader.dart';
import 'package:get/get.dart';

// A utility class for managing a full-screen loading dialog
class AFullScreenLoader {
  //open a full scren loading dialog with a f=given text and animation .
  // this method does not return anything .
  //
  //parameters :
  // text : the text to be diaplaced in the loading dialog .
  // animation :  the lottie animation to be shown .

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      // ignore: deprecated_member_use
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          color: Colors.black,
          child: Center(
            child: SingleChildScrollView(
              child: AAnimationLoaderWidget(
                text: text,
                animation: animation,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //stop the currectly open loading dialog .
  // this method does not return any thing .

  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); //close the dialog using the navigator
  }
}
