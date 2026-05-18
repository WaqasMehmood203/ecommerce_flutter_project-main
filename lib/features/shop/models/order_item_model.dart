import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItemModel {
  final String id;
  final String productId;
  final String productTitle;
  final String productImage;
  final int quantity;
  final double unitPrice;
  final double itemTotalPrice; // quantity * unitPrice
  final double? taxAmount;
  final Map<String, String>? selectedVariations;

  OrderItemModel({
    required this.id,
    required this.productId,
    required this.productTitle,
    required this.productImage,
    required this.quantity,
    required this.unitPrice,
    required this.itemTotalPrice,
    this.taxAmount,
    this.selectedVariations,
  });

  static OrderItemModel empty() => OrderItemModel(
    id: '',
    productId: '',
    productTitle: '',
    productImage: '',
    quantity: 0,
    unitPrice: 0,
    itemTotalPrice: 0,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productTitle': productTitle,
      'productImage': productImage,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'itemTotalPrice': itemTotalPrice,
      'taxAmount': taxAmount,
      'selectedVariations': selectedVariations,
    };
  }

  factory OrderItemModel.fromJson(Map<String, dynamic> data) {
    return OrderItemModel(
      id: data['id'] as String? ?? '',
      productId: data['productId'] as String? ?? '',
      productTitle: data['productTitle'] as String? ?? '',
      productImage: data['productImage'] as String? ?? '',
      quantity: (data['quantity'] as num?)?.toInt() ?? 0,
      unitPrice: (data['unitPrice'] as num?)?.toDouble() ?? 0.0,
      itemTotalPrice: (data['itemTotalPrice'] as num?)?.toDouble() ?? 0.0,
      taxAmount: (data['taxAmount'] as num?)?.toDouble(),
      selectedVariations: data['selectedVariations'] != null
          ? Map<String, String>.from(data['selectedVariations'] as Map)
          : null,
    );
  }

  factory OrderItemModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) {
      throw StateError('Order item document data is null for ID: ${snapshot.id}');
    }
    return OrderItemModel.fromJson({...data, 'id': snapshot.id});
  }
}
