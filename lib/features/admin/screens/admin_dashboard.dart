import 'package:flutter/material.dart';
import 'package:flutterproject/data/repositories/authentication/authentication_repository.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/features/admin/controllers/admin_controller.dart';
import 'package:flutterproject/features/admin/screens/admin_orders_screen.dart';
import 'package:flutterproject/features/admin/screens/admin_users_screen.dart';
import 'package:flutterproject/utils/constants/colors.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final controller = Get.put(AdminController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadUsers();
      controller.loadAllOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Asizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AAppBar(
                showBackArrow: false,
                title: Text(
                  'Admin Dashboard',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: Asizes.sm),
              // Right side quick action: Logout
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () async {
                      Get.defaultDialog(
                        title: 'Logout',
                        middleText: 'Are you sure you want to logout?',
                        textConfirm: 'Yes',
                        textCancel: 'Cancel',
                        onConfirm: () async {
                          Get.back();
                          try {
                            await AuthenticationRepository.instance.logout();
                          } catch (e) {
                            Get.snackbar(
                              'Logout failed',
                              e.toString(),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                      );
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      elevation: 4,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Asizes.spaceBtwSections),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                // Build richer dashboard with stats and a simple orders chart
                final totalUsers = controller.users.length;
                final totalOrders = controller.orders.length;

                // compute orders per day for last 7 days
                final now = DateTime.now();
                final last7 = List.generate(
                  7,
                  (i) => DateTime(
                    now.year,
                    now.month,
                    now.day,
                  ).subtract(Duration(days: 6 - i)),
                );
                final counts = List<int>.filled(7, 0);
                for (var o in controller.orders) {
                  for (var i = 0; i < last7.length; i++) {
                    final day = last7[i];
                    if (o.orderDate.year == day.year &&
                        o.orderDate.month == day.month &&
                        o.orderDate.day == day.day) {
                      counts[i]++;
                      break;
                    }
                  }
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            title: 'Users',
                            value: totalUsers.toString(),
                          ),
                        ),
                        const SizedBox(width: Asizes.sm),
                        Expanded(
                          child: _buildStatCard(
                            title: 'Orders',
                            value: totalOrders.toString(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Asizes.spaceBtwSections),
                    Text(
                      'Orders (last 7 days)',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: Asizes.sm),
                    // Summary chips to reduce empty space and show quick stats
                    Row(
                      children: [
                        Chip(
                          backgroundColor: Theme.of(context).cardColor,
                          label: Text(
                            'Last 7 days: ${counts.reduce((a, b) => a + b)}',
                          ),
                        ),
                        const SizedBox(width: Asizes.sm),
                        Chip(
                          backgroundColor: Theme.of(context).cardColor,
                          label: Text(
                            'Avg/day: ${(counts.isEmpty ? 0 : (counts.reduce((a, b) => a + b) / counts.length)).toStringAsFixed(1)}',
                          ),
                        ),
                        const SizedBox(width: Asizes.sm),
                        if (counts.any((c) => c > 0))
                          Chip(
                            backgroundColor: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.12),
                            label: Text(
                              'Peak: ${counts.reduce((a, b) => a > b ? a : b)}',
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: Asizes.sm),
                    SizedBox(
                      height: 140,
                      width: double.infinity,
                      child: OrdersBarChart(
                        data: counts,
                        labels:
                            last7.map((d) => '${d.month}/${d.day}').toList(),
                      ),
                    ),
                    const SizedBox(height: Asizes.spaceBtwSections),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                Get.to(() => const AdminUsersScreen()),
                            icon: const Icon(Icons.people),
                            label: const Text('View Users'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 3,
                              textStyle: Theme.of(
                                context,
                              ).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        const SizedBox(width: Asizes.sm),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                Get.to(() => const AdminOrdersScreen()),
                            icon: const Icon(Icons.shopping_bag),
                            label: const Text('View Orders'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 3,
                              textStyle: Theme.of(
                                context,
                              ).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Asizes.sm),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({required String title, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Asizes.lg),
      decoration: BoxDecoration(
        color: AColors.darkerGrey,
        borderRadius: BorderRadius.circular(Asizes.md),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(
            Icons.analytics,
            size: 28,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

class OrdersBarChart extends StatelessWidget {
  final List<int> data;
  final List<String> labels;

  const OrdersBarChart({super.key, required this.data, required this.labels});

  @override
  Widget build(BuildContext context) {
    final maxVal = data.isEmpty
        ? 1
        : (data.reduce(
            (a, b) => a > b ? a : b,
          )).clamp(1, double.infinity).toInt();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // compute bar width to spread bars across available width
          final spacing = 8.0;
          final totalSpacing = spacing * (data.length - 1);
          final available = (constraints.maxWidth - totalSpacing).clamp(
            0.0,
            double.infinity,
          );
          final barWidth = (available / (data.isEmpty ? 1 : data.length)).clamp(
            12.0,
            48.0,
          );

          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(data.length, (i) {
              final hFactor = maxVal == 0 ? 0.0 : data[i] / maxVal;
              return Container(
                width: barWidth,
                margin: EdgeInsets.only(
                  right: i == data.length - 1 ? 0 : spacing,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 100 * hFactor,
                      width: barWidth,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 6),
                    FittedBox(
                      child: Text(
                        labels[i],
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
