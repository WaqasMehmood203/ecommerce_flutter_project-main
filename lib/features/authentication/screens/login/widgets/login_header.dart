import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:flutterproject/utils/constants/text_strings.dart';

class ALoginHeader extends StatelessWidget {
  const ALoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AImages.promoBanner3,
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.55),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  ATexts.appName,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: Asizes.spaceBtwItems),
        Text(ATexts.LoginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: Asizes.sm),
        Text(ATexts.LoginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: Asizes.spaceBtwSections),
      ],
    );
  }
}
