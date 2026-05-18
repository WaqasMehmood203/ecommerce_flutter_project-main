import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/features/admin/controllers/admin_controller.dart';
import 'package:flutterproject/features/admin/screens/admin_order_details_screen.dart';
import 'package:flutterproject/features/authentication/models/user_model.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AdminUserOrdersScreen extends StatefulWidget {
  const AdminUserOrdersScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<AdminUserOrdersScreen> createState() => _AdminUserOrdersScreenState();
}

class _AdminUserOrdersScreenState extends State<AdminUserOrdersScreen> {
  final controller = Get.put(AdminController());
  final RxList<OrderModel> userOrders = <OrderModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadOrders();
    });
  }

  Future<void> _loadOrders() async {
    isLoading.value = true;
    userOrders.assignAll(await controller.loadOrdersForUser(widget.user.id));
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AAppBar(
            showBackArrow: true,
            title: Text('${widget.user.fullName} Orders',
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Asizes.defaultSpace),
              child: Obx(() {
                if (isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (userOrders.isEmpty) {
                  return const Center(
                      child: Text('No orders available for this user.'));
                }
                return ListView.separated(
                  itemCount: userOrders.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: Asizes.sm),
                  itemBuilder: (context, index) {
                    final order = userOrders[index];
                    return Card(
                      margin: EdgeInsets.zero,
                      child: ListTile(
                        title: Text('Order ${order.formattedOrderId}'),
                        subtitle: Text(
                            'Total: \$${order.totalAmount.toStringAsFixed(2)}'),
                        trailing: Text(order.status.toString().split('.').last),
                        onTap: () async {
                          final result = await Get.to(() =>
                              AdminOrderDetailsScreen(
                                  order: order, user: widget.user));
                          if (result != null && result is OrderModel) {
                            final idx =
                                userOrders.indexWhere((o) => o.id == result.id);
                            if (idx != -1) {
                              userOrders[idx] = result;
                              userOrders
                                  .refresh(); // Trigger Obx rebuild immediately
                            }
                          }
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
