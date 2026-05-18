import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class AEmptyState extends StatelessWidget {
  const AEmptyState({
    super.key,
    required this.title,
    this.subtitle = '',
    this.animation = AImages.emptyAnimation,
    this.buttonText,
    this.onButtonPressed,
  });

  final String title;
  final String subtitle;
  final String animation;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Asizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                animation,
                width: MediaQuery.of(context).size.width * 0.6,
                repeat: true,
              ),
              const SizedBox(height: Asizes.spaceBtwItems),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (subtitle.isNotEmpty) ...[
                const SizedBox(height: Asizes.spaceBtwItems / 2),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color
                        ?.withAlpha((0.72 * 255).round()),
                  ),
                ),
              ],
              if (buttonText != null && onButtonPressed != null) ...[
                const SizedBox(height: Asizes.spaceBtwSections),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(buttonText!),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
