import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Pages/Auth/LoginPage.dart';
import 'package:news_app/Controller/ThemeController.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const CircleAvatar(
                  radius: 60,
                  child: Icon(Icons.person, size: 60),
                ),
                const SizedBox(height: 15),
                Text(
                  'xyz',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'xyz@example.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildProfileOption(
                    context,
                    icon: Icons.bookmark_border,
                    title: 'Saved Articles',
                    subtitle: '24 articles',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.language,
                    title: 'Language',
                    subtitle: 'English',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Enabled',
                    onTap: () {},
                  ),
                  Obx(() {
                    final themeController = Get.put(ThemeController());
                    return _buildProfileOption(
                      context,
                      icon: Icons.dark_mode_outlined,
                      title: 'Theme',
                      subtitle: themeController.currentThemeName,
                      onTap: () => _showThemeDialog(context),
                    );
                  }),
                  _buildProfileOption(
                    context,
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.info_outline,
                    title: 'About',
                    subtitle: 'Version 1.0.0',
                    onTap: () {},
                  ),
                  _buildProfileOption(
                    context,
                    icon: Icons.logout,
                    title: 'Logout',
                    isLogout: true,
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isLogout
                ? Colors.red.withOpacity(0.1)
                : Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: isLogout
                ? Colors.red
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isLogout ? Colors.red : null,
          ),
        ),
        subtitle: subtitle != null
            ? Text(subtitle, style: Theme.of(context).textTheme.bodySmall)
            : null,
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textConfirm: 'Logout',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      cancelTextColor: Theme.of(context).colorScheme.primary,
      onConfirm: () {
        Get.back();
        Get.offAll(() => const LoginPage());
        Get.snackbar(
          'Logged Out',
          'You have been successfully logged out',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      },
    );
  }

  void _showThemeDialog(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    Get.defaultDialog(
      title: 'Choose Theme',
      titleStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      radius: 16,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => _buildThemeOption(
              context,
              title: 'Light',
              icon: Icons.light_mode,
              isSelected: themeController.themeMode.value == ThemeMode.light,
              onTap: () {
                themeController.setThemeMode(ThemeMode.light);
                Get.back();
              },
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => _buildThemeOption(
              context,
              title: 'Dark',
              icon: Icons.dark_mode,
              isSelected: themeController.themeMode.value == ThemeMode.dark,
              onTap: () {
                themeController.setThemeMode(ThemeMode.dark);
                Get.back();
              },
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => _buildThemeOption(
              context,
              title: 'System Default',
              icon: Icons.settings_suggest,
              isSelected: themeController.themeMode.value == ThemeMode.system,
              onTap: () {
                themeController.setThemeMode(ThemeMode.system);
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }
}
