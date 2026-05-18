import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/layouts/grid_layout.dart';
import 'package:flutterproject/common/widgets/loaders/shimmer.dart';
import 'package:flutterproject/utils/constants/sizes.dart';

class AVerticalProductShimmer extends StatelessWidget {
  const AVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///image
                  AShimmerEffect(width: 180, height: 180),
                  SizedBox(height: Asizes.spaceBtwItems),

                  ///Text
                  AShimmerEffect(width: 160, height: 15),
                  SizedBox(height: Asizes.spaceBtwItems / 2),
                  AShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}
