// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterproject/features/admin/screens/admin_dashboard.dart';
import 'package:flutterproject/features/admin/screens/admin_orders_screen.dart';
import 'package:flutterproject/features/admin/screens/admin_users_screen.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class AdminNavigationMenu extends StatelessWidget {
  const AdminNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = AHelperFunctions.isDarkMode(context);
    final controller = Get.put(AdminNavigationController());

    return Scaffold(
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? AColors.black : AColors.white,
          indicatorColor: darkMode
              ? AColors.white.withOpacity(0.1)
              : AColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.dashboard), label: 'Dashboard'),
            NavigationDestination(icon: Icon(Icons.group), label: 'Users'),
            NavigationDestination(
                icon: Icon(Icons.shopping_bag), label: 'Orders'),
          ],
        ),
      ),
    );
  }
}

class AdminNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const AdminDashboardScreen(),
    const AdminUsersScreen(),
    const AdminOrdersScreen(),
  ];
}
