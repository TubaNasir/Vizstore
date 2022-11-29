import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title, description;
  final String image;
  final int price;
  final String storeId;
  final String category;
  int stock; //stock

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.storeId,
    required this.category,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json, String id) => Product(
    id: id,
    title: json["title"],
    description: json["description"],
    image: json["image"],
    price: json["price"],
    category: json["category"],
    stock: json["stock"],
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
  };
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: "1",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
    title: "Wireless Controller for PS4™ nsadfk akjdnaksj kjands",
    price: 1000,
    description: "This is a red shirt. Material is agdjd dlfk skrn fjrndf erfr kenedf resjfnr",
    storeId: "1",
    category: "Clothing",
    stock: 5,
  ),
  Product(
    id: "2",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
    title: "Wireless Controller for PS4™",
    price: 1000,
    description: "This is a red shirt. Material is agdjd",
    category: "Clothing",
    storeId: "1",
    stock: 5,

  ),
  Product(
    id: "3",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
    title: "Wireless Controller for PS4™",
    price: 1000,
    description: "This is a red shirt. Material is agdjd",
    category: "Clothing",
    storeId: "2",
    stock: 5,

  ),
  Product(
    id: "5",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ_0CtulSwA_imJJ4nZXEIwu13VNszMaZUBaHgEXVQ&s",
    title: "Wireless Controller for PS4™",
    price: 1000,
    description: "This is a red shirt. Material is agdjd",
    category: "Clothing",
    storeId: "2",
    stock: 5,
  ),
];

