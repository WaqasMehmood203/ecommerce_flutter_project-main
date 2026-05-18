import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/loaders/shimmer.dart';
import 'package:flutterproject/utils/constants/sizes.dart';

class AListTileShimmer extends StatelessWidget {
  const AListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            AShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            SizedBox(
              width: Asizes.spaceBtwItems,
            ),
            Column(
              children: [
                AShimmerEffect(width: 100, height: 15),
                SizedBox(
                  height: Asizes.spaceBtwItems / 2,
                ),
                AShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
