import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/loaders/shimmer.dart';
import 'package:flutterproject/utils/constants/sizes.dart';

class ABoxesShimmer extends StatelessWidget {
  const ABoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: AShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: Asizes.spaceBtwItems,
            ),
            Expanded(child: AShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: Asizes.spaceBtwItems,
            ),
            Expanded(child: AShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
