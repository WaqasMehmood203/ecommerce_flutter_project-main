import 'package:flutterproject/features/personalization/controllers/address_controller.dart';
import 'package:flutterproject/features/shop/controllers/product/cart_controller.dart';
import 'package:flutterproject/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutterproject/features/shop/controllers/product/order_controller.dart';
import 'package:flutterproject/features/shop/controllers/product/product_controller.dart';
import 'package:flutterproject/utils/netowrk/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override

  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AddressController());
    Get.put(CheckoutController());
    Get.put(CartController());
    Get.put(ProductController());
    Get.put(OrderController());
  }
}
