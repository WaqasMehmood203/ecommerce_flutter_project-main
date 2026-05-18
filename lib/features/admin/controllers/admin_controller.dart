import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/data/repositories/order/order_repository.dart';
import 'package:flutterproject/data/repositories/user/user_repository.dart';
import 'package:flutterproject/features/authentication/models/user_model.dart';
import 'package:flutterproject/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  static AdminController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final orderRepository = Get.put(OrderRepository());

  final RxBool isLoading = false.obs;
  final RxList<UserModel> users = <UserModel>[].obs;
  final RxList<OrderModel> orders = <OrderModel>[].obs;

  Future<void> loadUsers() async {
    try {
      isLoading.value = true;
      final fetchedUsers = await userRepository.fetchAllUsers();
      users.assignAll(fetchedUsers);
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Error', message: e.toString());
      users.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadAllOrders() async {
    try {
      isLoading.value = true;
      final fetchedOrders = await orderRepository.fetchAllOrders();
      orders.assignAll(fetchedOrders);
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Error', message: e.toString());
      orders.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<OrderModel>> loadOrdersForUser(String userId) async {
    try {
      isLoading.value = true;
      final fetchedOrders = await orderRepository.fetchOrdersForUser(userId);
      return fetchedOrders;
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }
}
