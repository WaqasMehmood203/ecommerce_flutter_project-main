import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController get instance => Get.find();

  final _storage = GetStorage();
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    // Load saved theme preference or default to system
    final savedTheme = _storage.read('theme_mode');
    if (savedTheme != null) {
      themeMode.value = ThemeMode.values[savedTheme as int];
    } else {
      themeMode.value = ThemeMode.system;
    }
  }

  // Toggle between light and dark mode
  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      // System mode - switch to light
      themeMode.value = ThemeMode.light;
    }

    // Save to storage
    _storage.write('theme_mode', themeMode.value.index);
  }

  // Check if dark mode is enabled
  bool get isDarkMode {
    if (themeMode.value == ThemeMode.dark) {
      return true;
    } else if (themeMode.value == ThemeMode.light) {
      return false;
    }
    // For system mode, check the system brightness
    return Get.isDarkMode;
  }
}
