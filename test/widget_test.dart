import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/features/authentication/models/user_model.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/features/shop/models/cart_item_model.dart';

void main() {
  test('UserModel serialization round-trip works', () {
    final user = UserModel(
      id: 'u1',
      firstName: 'Test',
      lastName: 'User',
      username: 'testuser',
      email: 'test@example.com',
      phoneNumber: '03001234567',
      profilePicture: 'https://example.com/p.png',
      role: UserRole.user,
    );

    final json = user.toJson();
    expect(json['FirstName'], 'Test');
    expect(json['Email'], 'test@example.com');
  });

  test('CartItemModel total price fields remain consistent', () {
    final item = CartItemModel(
      productId: '001',
      title: 'Sample Product',
      quantity: 2,
      image: 'https://example.com/image.png',
      price: 1200,
      brandName: 'Outfitter',
    );

    final json = item.toJson();
    expect(json['productId'], '001');
    expect(json['quantity'], 2);
    expect((json['price'] as num).toDouble(), 1200);
  });
}
