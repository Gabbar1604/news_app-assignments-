import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  var themeMode = ThemeMode.system.obs;

  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
      isDarkMode.value = true;
    } else if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.system;
      isDarkMode.value = false;
    } else {
      themeMode.value = ThemeMode.light;
      isDarkMode.value = false;
    }
    Get.changeThemeMode(themeMode.value);
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    isDarkMode.value = mode == ThemeMode.dark;
    Get.changeThemeMode(mode);
  }

  String get currentThemeName {
    switch (themeMode.value) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System default';
    }
  }
}
