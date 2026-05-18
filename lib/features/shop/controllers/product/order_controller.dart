import 'package:flutter/cupertino.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/features/shop/screens/checkout/order_success_screen.dart';
import 'package:flutterproject/data/repositories/authentication/authentication_repository.dart';
import 'package:flutterproject/data/repositories/order/order_repository.dart';
import 'package:flutterproject/features/personalization/controllers/address_controller.dart';
import 'package:flutterproject/features/shop/controllers/product/cart_controller.dart';
import 'package:flutterproject/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:flutterproject/features/shop/models/payment_info_model.dart';
import 'package:flutterproject/navigation_menu.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/utils/constants/image_strings.dart';
import 'package:flutterproject/utils/netowrk/network_manager.dart';
import 'package:flutterproject/utils/popup/full_screen_loader.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  final RxBool isLoading = false.obs;
  final RxList<OrderModel> orders = <OrderModel>[].obs;
  final Rx<OrderModel?> selectedOrder = Rx<OrderModel?>(null);

  // Fetch users order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      isLoading.value = true;
      final userOrders = await orderRepository.fetchUserOrders();
      orders.assignAll(userOrders);
      return userOrders;
    } catch (e) {
      ALoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  // Get single order details
  Future<OrderModel?> getOrderDetails(String orderId) async {
    try {
      isLoading.value = true;
      final order = await orderRepository.getOrderById(orderId);
      selectedOrder.value = order;
      return order;
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Error', message: e.toString());
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  // Process order at checkout
  Future<void> processOrder(double totalAmount) async {
    try {
      debugPrint('🛒 Starting order processing...');
      
      if (cartController.cartItems.isEmpty) {
        ALoaders.warningSnackBar(
          title: 'Empty Cart',
          message: 'Add items in cart before checkout.',
        );
        return;
      }

      final user = AuthenticationRepository.instance.authUser;
      final userId = user?.uid ?? 'guest_user_id';
      debugPrint('👤 User ID: $userId');

      // Generate unique order ID
      const uuid = Uuid();
      final orderId = uuid.v4();
      debugPrint('📦 Order ID generated: $orderId');

      // Calculate totals properly
      final subtotal = cartController.totalCartPrice.value;
      const shippingFee = 5.0;
      final taxFee = subtotal * 0.08; // 8% tax
      final finalTotal = subtotal + shippingFee + taxFee;
      
      debugPrint('💰 Subtotal: $subtotal, Shipping: $shippingFee, Tax: $taxFee, Total: $finalTotal');

      // Create order model
      final order = OrderModel(
        id: orderId,
        userId: userId,
        status: OrderStatus.processing,
        totalAmount: finalTotal,
        subtotal: subtotal,
        shippingFee: shippingFee,
        taxFee: taxFee,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now().add(const Duration(days: 3)),
        items: cartController.cartItems.toList(),
      );
      
      debugPrint('📋 Order model created');

      // Start loader
      AFullScreenLoader.openLoadingDialog(
          'Processing your order...', AImages.pencilAnimation);
      debugPrint('⏳ Loading dialog opened');

      try {
        // Save order to Firestore
        if (userId != 'guest_user_id') {
          debugPrint('💾 Saving order to Firestore...');
          await orderRepository.saveOrder(order, userId);
          debugPrint('✅ Order saved successfully');

          // Save payment information
          final paymentId = uuid.v4();
          final paymentInfo = PaymentInfoModel(
            id: paymentId,
            orderId: orderId,
            paymentMethod: checkoutController.selectedPaymentMethod.value.name,
            transactionId: 'TXN_$orderId',
            amount: finalTotal,
            paymentDate: DateTime.now(),
            status: 'completed',
            cardBrand: checkoutController.selectedPaymentMethod.value.name,
          );

          debugPrint('💳 Saving payment info...');
          await orderRepository.savePaymentInfo(paymentInfo, userId, orderId);
          debugPrint('✅ Payment info saved');

          // Update order status to pending after payment
          debugPrint('🔄 Updating order status...');
          await orderRepository.updateOrderStatus(orderId, OrderStatus.pending);
          debugPrint('✅ Order status updated');
        } else {
          // Simulate local save for guest users
          debugPrint('👻 Guest user - simulating save');
          await Future.delayed(const Duration(seconds: 1));
        }
      } catch (e) {
        debugPrint('❌ Firebase Save Error: $e');
        ALoaders.errorSnackBar(title: 'Database Error', message: e.toString());
        return;
      }

      // Clear cart
      cartController.clearCart();
      debugPrint('🧹 Cart cleared');

      // Dismiss loader and show success screen
      AFullScreenLoader.stopLoading();
      debugPrint('✅ Loader stopped');
      
      debugPrint('🎉 Navigating to Order Success Screen...');
      Get.off(
        () => OrderSuccessScreen(order: order),
      );
      debugPrint('✅ Order success screen displayed');
    } catch (e) {
      debugPrint('❌ CRITICAL ERROR in processOrder: $e');
      ALoaders.errorSnackBar(title: 'Order Error', message: e.toString());
      AFullScreenLoader.stopLoading();
    }
  }

  // Update order status
  Future<void> updateOrderStatus(
    String orderId,
    OrderStatus status, {
    String? trackingNumber,
  }) async {
    try {
      isLoading.value = true;
      
      DateTime? shippedDate;
      DateTime? deliveredDate;

      if (status == OrderStatus.shipped) {
        shippedDate = DateTime.now();
      } else if (status == OrderStatus.delivered) {
        deliveredDate = DateTime.now();
      }

      await orderRepository.updateOrderStatus(
        orderId,
        status,
        trackingNumber: trackingNumber,
        shippedDate: shippedDate,
        deliveredDate: deliveredDate,
      );

      ALoaders.successSnackBar(
        title: 'Success',
        message: 'Order status updated successfully',
      );

      // Refresh order details
      await getOrderDetails(orderId);
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Cancel order
  Future<void> cancelOrder(String orderId) async {
    try {
      isLoading.value = true;
      await orderRepository.cancelOrder(orderId);
      ALoaders.successSnackBar(
        title: 'Success',
        message: 'Order cancelled successfully',
      );
      await getOrderDetails(orderId);
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

