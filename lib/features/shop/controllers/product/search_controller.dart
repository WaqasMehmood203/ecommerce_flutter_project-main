import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/data/repositories/product/product_repository.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ProductSearchController extends GetxController {
  static ProductSearchController get instance => Get.find();

  final repository = Get.put(ProductRepository());
  final isSearching = false.obs;
  final RxString query = ''.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  void searchProducts(String text) async {
    query.value = text.trim();
    if (query.value.isEmpty) {
      products.clear();
      return;
    }

    isSearching.value = true;
    try {
      final response = await repository.searchProducts(query.value);
      products.assignAll(response);
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Search failed', message: e.toString());
      products.clear();
    } finally {
      isSearching.value = false;
    }
  }

  void clearSearch() {
    query.value = '';
    products.clear();
  }
}
