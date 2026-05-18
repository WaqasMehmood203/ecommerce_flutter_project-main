import 'package:flutterproject/common/widgets/loaders/loaders.dart';
import 'package:flutterproject/features/shop/models/cart_item_model.dart';
import 'package:flutterproject/features/shop/models/product_model.dart';
import 'package:flutterproject/utils/constants/enums.dart';
import 'package:flutterproject/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // variables

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  // final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  // Add items in the cart

  void  addToCart(ProductModel product) {
    //Quantity check
    if (productQuantityInCart.value < 1) {
      ALoaders.customToast(message: 'Select Quantity');
      return;
    }

    // out of stocl status
    if (product.stock < 1) {
      ALoaders.warningSnackBar(
          title: 'Oh Snap!', message: 'Selected Product is out of stock.');
      return;
    }

    // convert the product model to a cartItemmodel with the given quantity
    final selectedCartItems =
        convertToCartItem(product, productQuantityInCart.value);

    if (selectedCartItems == null) {
      ALoaders.warningSnackBar(
          title: 'Oh Snap!',
          message: 'Product type not supported for adding to cart.');
      return; // Exit the function if conversion failed
    }
    //check if already added in the cart
    int index = cartItems.indexWhere(
        (cartItem) => cartItem.productId == selectedCartItems.productId);

    if (index >= 0) {
      // This quantity is already added or updated / removed from the design cart.
      cartItems[index].quantity = selectedCartItems.quantity;
    } else {
      cartItems.add(selectedCartItems);
    }

    updateCart();
    productQuantityInCart.value = 0; // Reset quantity after adding
    ALoaders.customToast(message: 'Your product has been added to the cart.');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        //show dialog before completely removing
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }

    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove from Cart',
      middleText: 'Are You Sure You Want to remove this product ?',
      onConfirm: () {
        //Remove the item from the cart
        cartItems.removeAt(index);
        updateCart();
        ALoaders.customToast(message: 'Product removed from the Cart.');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  // Initialize already added items count in the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    // if product has no variations then calculate cartEntries and display total number .
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }
  }

  //This function converts a product model to a cart item model
  CartItemModel? convertToCartItem(ProductModel product, int quantity) {
    // Changed return type to be nullable
    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: product.price,
      salePrice: product.salePrice,
      quantity: quantity,
      image: product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
    );
  }

  // update cart values

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.salePrice > 0.0 ? item.salePrice : item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    ALocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        ALocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
