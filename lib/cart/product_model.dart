import 'package:flutter/material.dart';


class Product1 {
  final int id;
  final String title, description;
  final String image;
  final int price;
  final int storeID;
  int qty;

  Product1({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.storeID,
    required this.qty
  });
}