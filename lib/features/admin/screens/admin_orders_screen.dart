import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/features/admin/controllers/admin_controller.dart';
import 'package:flutterproject/features/admin/screens/admin_order_details_screen.dart';
import 'package:flutterproject/features/authentication/models/user_model.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AdminOrdersScreen extends StatefulWidget {
  const AdminOrdersScreen({super.key});

  @override
  State<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> {
  final controller = Get.put(AdminController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAllOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AAppBar(
            showBackArrow: true,
            title: Text('Orders',
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Asizes.defaultSpace),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.orders.isEmpty) {
                  return const Center(child: Text('No orders found.'));
                }
                return ListView.separated(
                  itemCount: controller.orders.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: Asizes.sm),
                  itemBuilder: (context, index) {
                    final order = controller.orders[index];
                    return _buildOrderTile(order);
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTile(OrderModel order) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text('Order ${order.formattedOrderId}'),
        subtitle: Text('Total: \$${order.totalAmount.toStringAsFixed(2)}'),
        trailing: Text(order.status.toString().split('.').last),
        onTap: () async {
          UserModel? user;
          try {
            user = controller.users.firstWhere((u) => u.id == order.userId);
          } catch (_) {
            user = null;
          }
          final result = await Get.to(
              () => AdminOrderDetailsScreen(order: order, user: user));
          if (result != null && result is OrderModel) {
            final idx = controller.orders.indexWhere((o) => o.id == result.id);
            if (idx != -1) {
              controller.orders[idx] = result;
            }
          }
        },
      ),
    );
  }
}
