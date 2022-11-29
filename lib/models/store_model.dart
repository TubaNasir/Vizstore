class StoreJson {
  const StoreJson({
    required this.storeManager,
    required this.storeName,
  });

  final String storeManager;
  final String storeName;

  const StoreJson.empty() : storeManager = '', storeName = '';

  factory StoreJson.fromJson(Map<String, dynamic> json) => StoreJson(
    storeManager: json["storeManager"] as String? ?? '',
    storeName: json["storeName"] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    "storeManager": storeManager,
    "storeName": storeName,
  };
}
