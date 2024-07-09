import 'package:flutter/material.dart';

class Product {
  final String title;
  final String desc;
  final Color color;

  Product({
    required this.title,
    required this.desc,
    required this.color,
  });
}

List<Product> products = [
  Product(
    title: "Health",
    color: const Color(0xFF71b8ff),
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  Product(
    title: "Food",
    color: const Color(0xFFff6374),
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  Product(
    title: "Shop list",
    color: const Color(0xFFffaa5b),
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  Product(
    title: "Team meeting",
    color: const Color(0xFF9ba0fc),
    desc:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
];
