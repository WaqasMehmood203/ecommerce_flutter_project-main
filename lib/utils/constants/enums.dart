// LIST OF Enums
// They cannot be vreated inside a class

enum TextSizes { small, medium, large }

enum UserRole { user, admin }

extension UserRoleExtension on UserRole {
  String get value => toString().split('.').last;

  static UserRole fromString(String? value) {
    switch (value) {
      case 'admin':
        return UserRole.admin;
      case 'user':
      default:
        return UserRole.user;
    }
  }
}

enum OrderStatus { processing, shipped, delivered, pending, cancelled }

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}

enum ProductType { single, variable }
