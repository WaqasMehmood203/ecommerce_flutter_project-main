// import 'package:flutter/material.dart';
// import 'package:flutterproject/common/widgets/loaders/shimmer.dart';
// import 'package:flutterproject/utils/constants/colors.dart';
// import 'package:flutterproject/utils/constants/sizes.dart';
// import 'package:flutterproject/utils/helpers/helper_functions.dart';

// class AProductCardHorizontalShimmer extends StatelessWidget {
//   const AProductCardHorizontalShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = AHelperFunctions.isDarkMode(context);

//     return Container(
//       width: 310,
//       padding: const EdgeInsets.all(1),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(Asizes.productImageRadius),
//         color: dark ? AColors.darkerGrey : AColors.lightContainer,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // -- Thumbnail Shimmer
//           Container(
//             height: 120,
//             width: 120,
//             padding: const EdgeInsets.all(Asizes.sm),
//             decoration: BoxDecoration(
//               color: dark ? AColors.dark : AColors.grey,
//               borderRadius: BorderRadius.circular(Asizes.productImageRadius),
//             ),
//             child: const AShimmerEffect(
//               width: 120,
//               height: 120,
//               radius: Asizes.productImageRadius,
//             ),
//           ),

//           // -- Details Shimmer
//           SizedBox(
//             width: 187,
//             child: Padding(
//               padding: const EdgeInsets.only(top: Asizes.sm, left: Asizes.sm),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title Shimmer
//                   const AShimmerEffect(
//                     width: 150,
//                     height: 20,
//                     radius: Asizes.sm,
//                   ),
//                   const SizedBox(height: Asizes.spaceBtwItems / 2),

//                   // Brand Title Shimmer
//                   const AShimmerEffect(
//                     width: 100,
//                     height: 15,
//                     radius: Asizes.sm,
//                   ),

//                   const Spacer(),

//                   // Price and Add to Cart Shimmer
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Price Shimmer
//                       const AShimmerEffect(
//                         width: 50,
//                         height: 20,
//                         radius: Asizes.sm,
//                       ),

//                       // Add to Cart Icon Shimmer
//                       const AShimmerEffect(
//                         width: Asizes.iconLg * 1.2,
//                         height: Asizes.iconLg * 1.2,
//                         radius: Asizes.productImageRadius,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/loaders/shimmer.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';

class AProductCardHorizontalShimmer extends StatelessWidget {
  const AProductCardHorizontalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Asizes.productImageRadius),
        color: dark ? AColors.darkerGrey : AColors.lightContainer,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Thumbnail Shimmer
          Container(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(Asizes.sm),
            decoration: BoxDecoration(
              color: dark ? AColors.dark : AColors.grey,
              borderRadius: BorderRadius.circular(Asizes.productImageRadius),
            ),
            child: const AShimmerEffect(
              width: 120,
              height: 120,
              radius: Asizes.productImageRadius,
            ),
          ),

          // -- Details Shimmer
          Expanded(
            // Use Expanded here as well for flexibility
            child: Padding(
              padding: const EdgeInsets.only(top: Asizes.sm, left: Asizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Distribute content
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Shimmer
                      const AShimmerEffect(
                        width: 150,
                        height: 20,
                        radius: Asizes.sm,
                      ),
                      const SizedBox(height: Asizes.spaceBtwItems / 2),

                      // Brand Title Shimmer
                      const AShimmerEffect(
                        width: 100,
                        height: 15,
                        radius: Asizes.sm,
                      ),
                    ],
                  ),

                  // Price and Add to Cart Shimmer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price Shimmer
                      const AShimmerEffect(
                        width: 50,
                        height: 20,
                        radius: Asizes.sm,
                      ),

                      // Add to Cart Icon Shimmer
                      const AShimmerEffect(
                        width: Asizes.iconLg * 1.2,
                        height: Asizes.iconLg * 1.2,
                        radius: Asizes.productImageRadius,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
