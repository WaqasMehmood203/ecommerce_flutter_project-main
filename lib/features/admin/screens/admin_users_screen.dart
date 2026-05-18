import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/features/admin/controllers/admin_controller.dart';
import 'package:flutterproject/features/admin/screens/admin_user_orders_screen.dart';
import 'package:flutterproject/features/authentication/models/user_model.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  final controller = Get.put(AdminController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AAppBar(
            showBackArrow: true,
            title:
                Text('Users', style: Theme.of(context).textTheme.headlineSmall),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Asizes.defaultSpace),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.users.isEmpty) {
                  return const Center(child: Text('No users found.'));
                }
                return ListView.separated(
                  itemCount: controller.users.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: Asizes.sm),
                  itemBuilder: (context, index) {
                    final user = controller.users[index];
                    return _buildUserTile(user);
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTile(UserModel user) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text(user.fullName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email),
            const SizedBox(height: Asizes.xs),
            Text('Phone: ${user.phoneNumber}'),
          ],
        ),
        trailing: Chip(
          label: Text(user.role.value),
          backgroundColor: user.role == UserRole.admin
              ? AColors.primary
              : AColors.grey.withOpacity(0.2),
        ),
        onTap: () => Get.to(() => AdminUserOrdersScreen(user: user)),
      ),
    );
  }
}
