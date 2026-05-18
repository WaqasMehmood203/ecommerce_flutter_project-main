import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/data/repositories/product/product_repository.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      ALoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) =>
            b.price.compareTo(a.price)); // Descending for higher price
        break;
      case 'Lower Price':
        products.sort(
            (a, b) => a.price.compareTo(b.price)); // Ascending for lower price
        break;
      case 'Newest':
        products.sort((a, b) =>
            b.date!.compareTo(a.date!)); // Descending for newest first
        break;
      case 'Sale':
        products.sort((a, b) {
          final aSalePrice = a.salePrice;
          final bSalePrice = b.salePrice;

          // Sort sale products first (higher sale price first)
          if (bSalePrice > 0 && aSalePrice > 0) {
            return bSalePrice.compareTo(aSalePrice);
          } else if (bSalePrice > 0) {
            return 1; // Move b (on sale) before a
          } else if (aSalePrice > 0) {
            return -1; // Move a (on sale) before b
          } else {
            return 0; // Both have no sale
          }
        });
        break;
      default:
        // Default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }

    // Refresh the list to update the UI
    products.refresh();
  }

  void assignProducts(List<ProductModel> products) {
    //Assign products to the 'products' list

    this.products.assignAll(products);
    sortProducts('Name');
  }
}
