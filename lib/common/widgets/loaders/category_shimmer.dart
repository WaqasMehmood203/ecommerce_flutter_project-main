import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/loaders/shimmer.dart';
import 'package:flutterproject/utils/constants/sizes.dart';

class ACategoryShimmer extends StatelessWidget {
  const ACategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
          width: Asizes.spaceBtwItems,
        ),
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              AShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: Asizes.spaceBtwItems / 2,
              ),

              //Text
              AShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
