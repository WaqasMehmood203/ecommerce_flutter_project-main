import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentInfoModel {
  final String id;
  final String orderId;
  final String paymentMethod;
  final String transactionId;
  final double amount;
  final DateTime paymentDate;
  final String status; // pending, completed, failed
  final String? cardLast4Digits;
  final String? cardBrand; // VISA, MasterCard, PayPal, etc.

  PaymentInfoModel({
    required this.id,
    required this.orderId,
    required this.paymentMethod,
    required this.transactionId,
    required this.amount,
    required this.paymentDate,
    required this.status,
    this.cardLast4Digits,
    this.cardBrand,
  });

  static PaymentInfoModel empty() => PaymentInfoModel(
    id: '',
    orderId: '',
    paymentMethod: '',
    transactionId: '',
    amount: 0,
    paymentDate: DateTime.now(),
    status: 'pending',
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'paymentMethod': paymentMethod,
      'transactionId': transactionId,
      'amount': amount,
      'paymentDate': Timestamp.fromDate(paymentDate),
      'status': status,
      'cardLast4Digits': cardLast4Digits,
      'cardBrand': cardBrand,
    };
  }

  factory PaymentInfoModel.fromJson(Map<String, dynamic> data) {
    return PaymentInfoModel(
      id: data['id'] as String? ?? '',
      orderId: data['orderId'] as String? ?? '',
      paymentMethod: data['paymentMethod'] as String? ?? '',
      transactionId: data['transactionId'] as String? ?? '',
      amount: (data['amount'] as num?)?.toDouble() ?? 0.0,
      paymentDate: (data['paymentDate'] as Timestamp).toDate(),
      status: data['status'] as String? ?? 'pending',
      cardLast4Digits: data['cardLast4Digits'] as String?,
      cardBrand: data['cardBrand'] as String?,
    );
  }

  factory PaymentInfoModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) {
      throw StateError('Payment info document data is null for ID: ${snapshot.id}');
    }
    return PaymentInfoModel.fromJson({...data, 'id': snapshot.id});
  }
}
