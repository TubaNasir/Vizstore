class StoreJson {
  const StoreJson({
    required this.id,
    required this.storeManager,
    required this.storeName,
  });

  final String id;
  final String storeManager;
  final String storeName;

  const StoreJson.empty() : id = '', storeManager = '', storeName = '';

  factory StoreJson.fromJson(Map<String, dynamic> json, String id) => StoreJson(
    id: id,
    storeManager: json["storeManager"] as String? ?? '',
    storeName: json["storeName"] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    "storeManager": storeManager,
    "storeName": storeName,
  };
}
