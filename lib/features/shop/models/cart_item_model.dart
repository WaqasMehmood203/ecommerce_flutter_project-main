class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  // String variationId;
  String? brandName;
  double salePrice;
  // Map<String, String>? selectedVariation;

  //constructor
  CartItemModel({
    required this.productId,
    required this.quantity,
    // this.variationId = '',
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.salePrice = 0.0,
    // this.selectedVariation,
  });

  // emoty cart

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  // convert a cart item to a JSON map

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'price': price,
      'image': image,
      'title': title,
      'brandName': brandName,
      'salePrice': salePrice,
      // 'variationId': variationId,
      // 'selectedVariation': selectedVariation
    };
  }

  //create a cartitem from a JSON map

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      quantity: json['quantity'],
      // price: json['price']?.toDouble(),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      image: json['image'],
      title: json['title'],
      brandName: json['brandName'],
      // salePrice: json['salePrice']?.toDouble(),
      salePrice: (json['salePrice'] as num?)?.toDouble() ?? 0.0,
      // variationId: json['variationId'],
      // selectedVariation: json['selectedVariation'] != null
      // ? Map<String, String>.from(json['selectedVariation'])
      // : null,
    );
  }
}
