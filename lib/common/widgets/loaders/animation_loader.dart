import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

//A Widget for diaplaying an animated loading indicator with optional text and action button .

class AAnimationLoaderWidget extends StatelessWidget {
  //default contructor for the AAnimationloaderwidget .

  //
  /// Parameters:
  /// text: The text to be displayed below the animation.
  /// animation: The path to the Lottie animation file.
  /// showAction: Whether to show an action button below the text.
  /// actionText: The text to be displayed on the action button.
  //  onActionPressed: Callback function to be executed when the action button is pressed.

  const AAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(
            height: Asizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Asizes.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: AColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: AColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutterproject/utils/constants/colors.dart';

// /// A Widget for displaying an animated loading indicator with optional text and action button.
// class AAnimationLoaderWidget extends StatelessWidget {
//   const AAnimationLoaderWidget({
//     super.key,
//     required this.text,
//     required this.gifImage,
//     this.showAction = false,
//     this.actionText,
//     this.onActionPressed,
//   });

//   final String text;
//   final String gifImage;
//   final bool showAction;
//   final String? actionText;
//   final VoidCallback? onActionPressed;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Center(
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               maxHeight: MediaQuery.of(context).size.height * 0.9,
//               maxWidth: MediaQuery.of(context).size.width * 0.9,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Flexible(
//                   child: Image.asset(
//                     gifImage,
//                     width: MediaQuery.of(context).size.width * 0.5,
//                     height: MediaQuery.of(context).size.width * 0.5,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   text,
//                   style: Theme.of(context).textTheme.bodyMedium,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 if (showAction)
//                   SizedBox(
//                     width: 250,
//                     child: OutlinedButton(
//                       onPressed: onActionPressed,
//                       style: OutlinedButton.styleFrom(
//                         backgroundColor: AColors.dark,
//                       ),
//                       child: Text(
//                         actionText!,
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyMedium!
//                             .apply(color: AColors.light),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
