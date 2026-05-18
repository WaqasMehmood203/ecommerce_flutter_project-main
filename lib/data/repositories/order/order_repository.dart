import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/data/repositories/authentication/authentication_repository.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:flutterproject/features/shop/models/payment_info_model.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository instance = Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all orders related to current user
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final authUser = AuthenticationRepository.instance.authUser;
      final userId = authUser?.uid;

      if (userId == null || userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes.';
      }

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching Order Information. Try again later';
    }
  }

  // Get all orders for a specific user
  Future<List<OrderModel>> fetchOrdersForUser(String userId) async {
    try {
      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching orders for the selected user.';
    }
  }

  // Get all orders across all users for admin viewing
  Future<List<OrderModel>> fetchAllOrders() async {
    try {
      final result = await _db.collectionGroup('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching all orders. Please try again later.';
    }
  }

  // Get single order by ID
  Future<OrderModel> getOrderById(String orderId) async {
    try {
      final authUser = AuthenticationRepository.instance.authUser;
      final userId = authUser?.uid;

      if (userId == null || userId.isEmpty) {
        throw 'Unable to find user information. Try again in few minutes.';
      }

      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .where('id', isEqualTo: orderId)
          .get();

      if (result.docs.isEmpty) {
        throw 'Order not found.';
      }

      return OrderModel.fromSnapshot(result.docs.first);
    } catch (e) {
      throw 'Something went wrong while fetching Order. Try again later: $e';
    }
  }

  // Save new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .doc(order.id)
          .set(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving Order information. Try again later: $e';
    }
  }

  // Update order status
  Future<void> updateOrderStatus(
    String orderId,
    OrderStatus newStatus, {
    String? trackingNumber,
    DateTime? shippedDate,
    DateTime? deliveredDate,
  }) async {
    try {
      final authUser = AuthenticationRepository.instance.authUser;
      final userId = authUser?.uid;

      if (userId == null || userId.isEmpty) {
        throw 'Unable to find user information.';
      }

      final updateData = <String, dynamic>{
        'status': newStatus.toString(),
        'trackingNumber': trackingNumber,
        'shippedDate':
            shippedDate != null ? Timestamp.fromDate(shippedDate) : null,
        'deliveredDate':
            deliveredDate != null ? Timestamp.fromDate(deliveredDate) : null,
      };

      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .doc(orderId)
          .update(updateData);
    } catch (e) {
      throw 'Failed to update order status: $e';
    }
  }

  // Admin: update order status for a specific user (doesn't rely on authenticated uid)
  Future<void> adminUpdateOrderStatus(
    String userId,
    String orderId,
    OrderStatus newStatus, {
    String? trackingNumber,
    DateTime? shippedDate,
    DateTime? deliveredDate,
  }) async {
    try {
      final updateData = <String, dynamic>{
        'status': newStatus.toString(),
        'trackingNumber': trackingNumber,
        'shippedDate':
            shippedDate != null ? Timestamp.fromDate(shippedDate) : null,
        'deliveredDate':
            deliveredDate != null ? Timestamp.fromDate(deliveredDate) : null,
      };

      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .doc(orderId)
          .update(updateData);
    } catch (e) {
      throw 'Admin failed to update order status: $e';
    }
  }

  // Save payment information
  Future<void> savePaymentInfo(
    PaymentInfoModel paymentInfo,
    String userId,
    String orderId,
  ) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .doc(orderId)
          .collection('Payments')
          .doc(paymentInfo.id)
          .set(paymentInfo.toJson());
    } catch (e) {
      throw 'Failed to save payment information: $e';
    }
  }

  // Get payment information for an order
  Future<List<PaymentInfoModel>> getOrderPayments(String orderId) async {
    try {
      final authUser = AuthenticationRepository.instance.authUser;
      final userId = authUser?.uid;

      if (userId == null || userId.isEmpty) {
        throw 'Unable to find user information.';
      }

      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .doc(orderId)
          .collection('Payments')
          .get();

      return result.docs
          .map((doc) => PaymentInfoModel.fromSnapshot(doc))
          .toList();
    } catch (e) {
      throw 'Failed to fetch payment information: $e';
    }
  }

  // Delete order (soft delete - status to cancelled)
  Future<void> cancelOrder(String orderId) async {
    try {
      await updateOrderStatus(orderId, OrderStatus.cancelled);
    } catch (e) {
      throw 'Failed to cancel order: $e';
    }
  }
}
