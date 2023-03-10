class WishlistItemJson {
  final String productId;

  WishlistItemJson({
    required this.productId
});

  static WishlistItemJson fromJson(Map<String, dynamic> json) => WishlistItemJson(
    productId: json["productId"] as String? ?? '',
  );

  Map<String, dynamic> toJson() =>{
    "productId": productId
};
}