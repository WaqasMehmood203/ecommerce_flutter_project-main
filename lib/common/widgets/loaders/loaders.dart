// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ALoaders {
  static BuildContext? get _context => Get.context;

  static void hideSnackBar() {
    final context = _context;
    if (context == null) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void _showSafeSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
    IconData? icon,
  }) {
    final context = _context;
    if (context == null) {
      debugPrint('$title: $message');
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 6,
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Row(
          children: [
            if (icon != null) ...[
              CircleAvatar(
                radius: 16,
                backgroundColor: AColors.white.withOpacity(0.15),
                child: Icon(icon, color: AColors.white, size: 18),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                '$title\n$message',
                style: const TextStyle(color: AColors.white, height: 1.3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static customToast({required message}) {
    final context = _context;
    if (context == null) {
      debugPrint(message.toString());
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AHelperFunctions.isDarkMode(context)
                ? AColors.darkGrey.withOpacity(0.95)
                : AColors.white.withOpacity(0.95),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AHelperFunctions.isDarkMode(context)
                    ? AColors.white
                    : AColors.dark,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    _showSafeSnackBar(
      title: title.toString(),
      message: message.toString(),
      backgroundColor: Colors.red.shade600,
      icon: Iconsax.warning_2,
    );
  }

  static warningSnackBar({required title, message = ''}) {
    _showSafeSnackBar(
      title: title.toString(),
      message: message.toString(),
      backgroundColor: Colors.orange,
      icon: Iconsax.warning_2,
    );
  }

  static successSnackBar({required title, message = ''}) {
    _showSafeSnackBar(
      title: title.toString(),
      message: message.toString(),
      backgroundColor: AColors.primary,
      icon: Iconsax.check,
    );
  }
}
