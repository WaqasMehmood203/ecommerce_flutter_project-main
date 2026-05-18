import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/features/personalization/models/address_model.dart';
import 'package:flutterproject/features/shop/models/cart_item_model.dart';
import 'package:flutterproject/features/shop/models/order_item_model.dart';
import 'package:flutterproject/features/shop/models/payment_info_model.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double subtotal;
  final double shippingFee;
  final double taxFee;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;
  final List<OrderItemModel>? orderItems; // Detailed order items
  final PaymentInfoModel? paymentInfo;
  final String? trackingNumber;
  final DateTime? shippedDate;
  final DateTime? deliveredDate;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.items,
    required this.totalAmount,
    this.subtotal = 0,
    this.shippingFee = 0,
    this.taxFee = 0,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
    this.orderItems,
    this.paymentInfo,
    this.trackingNumber,
    this.shippedDate,
    this.deliveredDate,
  });

  String get formattedOrderDate => AHelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? AHelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get formattedShippedDate => shippedDate != null
      ? AHelperFunctions.getFormattedDate(shippedDate!)
      : '';

  String get formattedDeliveredDate => deliveredDate != null
      ? AHelperFunctions.getFormattedDate(deliveredDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : status == OrderStatus.cancelled
              ? 'Cancelled'
              : 'Processing';

  String get formattedOrderId => id.substring(0, 8).toUpperCase();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(),
      'subtotal': subtotal,
      'shippingFee': shippingFee,
      'taxFee': taxFee,
      'totalAmount': totalAmount,
      'orderDate': Timestamp.fromDate(orderDate),
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'deliveryDate': deliveryDate != null ? Timestamp.fromDate(deliveryDate!) : null,
      'orderItems': orderItems?.map((item) => item.toJson()).toList(),
      'paymentInfo': paymentInfo?.toJson(),
      'items': items.map((item) => item.toJson()).toList(),
      'trackingNumber': trackingNumber,
      'shippedDate': shippedDate != null ? Timestamp.fromDate(shippedDate!) : null,
      'deliveredDate': deliveredDate != null ? Timestamp.fromDate(deliveredDate!) : null,
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;

    if (data == null) {
      throw StateError('Order document data is null for ID: ${snapshot.id}');
    }

    return OrderModel(
      id: data['id'] as String? ?? '',
      userId: data['userId'] as String? ?? '',
      status: OrderStatus.values.firstWhere(
          (e) => e.toString() == data['status'],
          orElse: () => OrderStatus.processing),
      subtotal: (data['subtotal'] as num?)?.toDouble() ?? 0.0,
      shippingFee: (data['shippingFee'] as num?)?.toDouble() ?? 0.0,
      taxFee: (data['taxFee'] as num?)?.toDouble() ?? 0.0,
      totalAmount: (data['totalAmount'] as num?)?.toDouble() ?? 0.0,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String? ?? '',
      address: data['address'] == null
          ? null
          : AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      deliveryDate: data['deliveryDate'] == null
          ? null
          : (data['deliveryDate'] as Timestamp).toDate(),
      orderItems: (data['orderItems'] as List<dynamic>?)
              ?.map((itemData) =>
                  OrderItemModel.fromJson(itemData as Map<String, dynamic>))
              .toList() ??
          [],
      paymentInfo: data['paymentInfo'] == null
          ? null
          : PaymentInfoModel.fromJson(data['paymentInfo'] as Map<String, dynamic>),
      items: (data['items'] as List<dynamic>?)
              ?.map((itemData) =>
                  CartItemModel.fromJson(itemData as Map<String, dynamic>))
              .toList() ??
          [],
      trackingNumber: data['trackingNumber'] as String?,
      shippedDate: data['shippedDate'] == null
          ? null
          : (data['shippedDate'] as Timestamp).toDate(),
      deliveredDate: data['deliveredDate'] == null
          ? null
          : (data['deliveredDate'] as Timestamp).toDate(),
    );
  }
}
