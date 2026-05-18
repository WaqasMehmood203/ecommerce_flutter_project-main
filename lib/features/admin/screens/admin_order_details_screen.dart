import 'package:flutter/material.dart';
import 'package:flutterproject/common/widgets/app_bar/appbar.dart';
import 'package:flutterproject/data/repositories/order/order_repository.dart';
import 'package:flutterproject/features/authentication/models/user_model.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:flutterproject/features/admin/controllers/admin_controller.dart';
import 'package:flutterproject/features/shop/controllers/product/order_controller.dart';

class AdminOrderDetailsScreen extends StatefulWidget {
  const AdminOrderDetailsScreen({super.key, required this.order, this.user});

  final OrderModel order;
  final UserModel? user;

  @override
  State<AdminOrderDetailsScreen> createState() =>
      _AdminOrderDetailsScreenState();
}

class _AdminOrderDetailsScreenState extends State<AdminOrderDetailsScreen> {
  late OrderStatus _selectedStatus;
  final OrderRepository _orderRepo = Get.find<OrderRepository>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.order.status;
  }

  Future<void> _updateStatus(OrderStatus status) async {
    setState(() {
      _isSaving = true;
    });
    try {
      if (widget.user != null) {
        await _orderRepo.adminUpdateOrderStatus(
            widget.user!.id, widget.order.id, status);
      } else {
        await _orderRepo.updateOrderStatus(widget.order.id, status);
      }
      setState(() {
        _selectedStatus = status;
      });
      // Update in AdminController orders list so grids update instantly
      try {
        final adminCtrl = Get.find<AdminController>();
        final idx = adminCtrl.orders.indexWhere((o) => o.id == widget.order.id);
        if (idx != -1) {
          final old = adminCtrl.orders[idx];
          final updated = OrderModel(
            id: old.id,
            userId: old.userId,
            status: status,
            items: old.items,
            totalAmount: old.totalAmount,
            subtotal: old.subtotal,
            shippingFee: old.shippingFee,
            taxFee: old.taxFee,
            orderDate: old.orderDate,
            paymentMethod: old.paymentMethod,
            address: old.address,
            deliveryDate: old.deliveryDate,
            orderItems: old.orderItems,
            paymentInfo: old.paymentInfo,
            trackingNumber: status == OrderStatus.shipped
                ? old.trackingNumber
                : old.trackingNumber,
            shippedDate: status == OrderStatus.shipped
                ? DateTime.now()
                : (status == OrderStatus.delivered ? old.shippedDate : null),
            deliveredDate: status == OrderStatus.delivered
                ? DateTime.now()
                : (status == OrderStatus.shipped ? old.deliveredDate : null),
          );
          adminCtrl.orders[idx] = updated;
        }
      } catch (_) {}

      // Update in user's OrderController if present (so the user UI updates)
      try {
        if (Get.isRegistered<OrderController>()) {
          final orderCtrl = Get.find<OrderController>();
          final idx2 =
              orderCtrl.orders.indexWhere((o) => o.id == widget.order.id);
          if (idx2 != -1) {
            final old = orderCtrl.orders[idx2];
            final updated2 = OrderModel(
              id: old.id,
              userId: old.userId,
              status: status,
              items: old.items,
              totalAmount: old.totalAmount,
              subtotal: old.subtotal,
              shippingFee: old.shippingFee,
              taxFee: old.taxFee,
              orderDate: old.orderDate,
              paymentMethod: old.paymentMethod,
              address: old.address,
              deliveryDate: old.deliveryDate,
              orderItems: old.orderItems,
              paymentInfo: old.paymentInfo,
              trackingNumber: old.trackingNumber,
              shippedDate: status == OrderStatus.shipped
                  ? DateTime.now()
                  : (status == OrderStatus.delivered ? old.shippedDate : null),
              deliveredDate: status == OrderStatus.delivered
                  ? DateTime.now()
                  : (status == OrderStatus.shipped ? old.deliveredDate : null),
            );
            orderCtrl.orders[idx2] = updated2;
            if (orderCtrl.selectedOrder.value?.id == updated2.id) {
              orderCtrl.selectedOrder.value = updated2;
            }
          }
        }
      } catch (_) {}
      Get.snackbar('Success', 'Order status updated');

      // Prepare an updated OrderModel to return to caller
      final updatedOrder = OrderModel(
        id: widget.order.id,
        userId: widget.order.userId,
        status: _selectedStatus,
        items: widget.order.items,
        totalAmount: widget.order.totalAmount,
        subtotal: widget.order.subtotal,
        shippingFee: widget.order.shippingFee,
        taxFee: widget.order.taxFee,
        orderDate: widget.order.orderDate,
        paymentMethod: widget.order.paymentMethod,
        address: widget.order.address,
        deliveryDate: widget.order.deliveryDate,
        orderItems: widget.order.orderItems,
        paymentInfo: widget.order.paymentInfo,
        trackingNumber: widget.order.trackingNumber,
        shippedDate: _selectedStatus == OrderStatus.shipped
            ? DateTime.now()
            : widget.order.shippedDate,
        deliveredDate: _selectedStatus == OrderStatus.delivered
            ? DateTime.now()
            : widget.order.deliveredDate,
      );

      // Return updated order to previous screen so it can update its local list
      Get.back(result: updatedOrder);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusOptions = OrderStatus.values;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Asizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AAppBar(
              showBackArrow: true,
              title: Text('Order Details',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            const SizedBox(height: Asizes.spaceBtwSections),
            if (widget.user != null)
              _buildSection(
                title: 'User',
                content: '${widget.user!.fullName} • ${widget.user!.email}',
              ),
            _buildSection(
              title: 'Order',
              content:
                  'Order ID: ${widget.order.formattedOrderId}\nTotal: \$${widget.order.totalAmount.toStringAsFixed(2)}',
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: Asizes.spaceBtwSections),
              child: Row(
                children: [
                  const Text('Status: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(width: Asizes.sm),
                  if (_isSaving) const CircularProgressIndicator(),
                  if (!_isSaving)
                    DropdownButton<OrderStatus>(
                      value: _selectedStatus,
                      items: statusOptions
                          .map((s) => DropdownMenuItem(
                              value: s,
                              child: Text(s.toString().split('.').last)))
                          .toList(),
                      onChanged: (val) async {
                        if (val != null && val != _selectedStatus) {
                          await _updateStatus(val);
                        }
                      },
                    ),
                ],
              ),
            ),
            if (widget.order.address != null)
              _buildSection(
                title: 'Shipping Address',
                content:
                    '${widget.order.address!.street}, ${widget.order.address!.city}, ${widget.order.address!.state}, ${widget.order.address!.country}',
              ),
            _buildSection(
              title: 'Payment',
              content: widget.order.paymentMethod,
            ),
            _buildSection(
              title: 'Items',
              content: widget.order.items
                  .map((item) =>
                      '${item.title} x${item.quantity} - \$${item.price.toStringAsFixed(2)}')
                  .join('\n'),
            ),
            const SizedBox(height: Asizes.spaceBtwSections),
            _buildSection(
              title: 'Totals',
              content:
                  'Subtotal: \$${widget.order.subtotal.toStringAsFixed(2)}\nShipping: \$${widget.order.shippingFee.toStringAsFixed(2)}\nTax: \$${widget.order.taxFee.toStringAsFixed(2)}\nTotal: \$${widget.order.totalAmount.toStringAsFixed(2)}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Asizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: Asizes.sm),
          Text(content),
        ],
      ),
    );
  }
}
