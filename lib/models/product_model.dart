import 'package:flutter/material.dart';

class ProductJson {
  final String id;
  final String title, description;
  final String image;
  final int price;
  final String storeId;
  final String category;
  final int stock;
  final int sold; //stock

  const ProductJson({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.storeId,
    required this.category,
    required this.stock,
    required this.sold,
  });

  ProductJson copyWith(
      {String? id,
        String? image,
        String? title,
        String? description,
        int? price,
        String? storeId,
        String? category,
        int? sold,
        int? stock
        }
      ) =>
      ProductJson(
        id: id ?? this.id,
        image: image ?? this.image,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        storeId: storeId ?? this.storeId,
        stock: stock ?? this.stock,
        sold: sold ?? this.sold,
        category: category ?? this.category,
      );

  const ProductJson.empty()
      : id = '',
        image = 'h',
        title = '',
        price = 0,
        description = '',
        storeId = '',
        category = '',
        stock = 0,
        sold = 0;

  factory ProductJson.fromJson(Map<String, dynamic> json, String id) =>
      ProductJson(
        id: id,
        title: json["title"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        category: json["category"],
        stock: json["stock"],
        sold: json["sold"],
        storeId: json["storeId"],
      );

  Map<String, dynamic> toJson() => {
        "productId": id,
        "title": title,
        "description": description,
        "image": image,
        "price": price,
        "stock": stock,
        "storeId": storeId,
        "sold": sold,
      };
}

// Our demo Products

List<ProductJson> demoProducts = [
  ProductJson(
    id: "1",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
    title: "Wireless Controller for PS4™ nsadfk akjdnaksj kjands",
    price: 1000,
    description:
        "This is a red shirt. Material is agdjd dlfk skrn fjrndf erfr kenedf resjfnr",
    storeId: "1",
    category: "Clothing",
    stock: 5,
    sold: 1,
  ),
  ProductJson(
    id: "2",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
    title: "Wireless Controller for PS4™",
    price: 1000,
    description: "This is a red shirt. Material is agdjd",
    category: "Clothing",
    storeId: "1",
    stock: 5,
    sold: 1,
  ),
  ProductJson(
    id: "3",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
    title: "Wireless Controller for PS4™",
    price: 1000,
    description: "This is a red shirt. Material is agdjd",
    category: "Clothing",
    storeId: "2",
    stock: 5,
    sold: 1,
  ),
  ProductJson(
    id: "5",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
    title: "Wireless Controller for PS4™",
    price: 1000,
    description: "This is a red shirt. Material is agdjd",
    category: "Clothing",
    storeId: "2",
    stock: 5,
    sold: 1,
  ),
];
