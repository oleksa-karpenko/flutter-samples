import 'package:flutter/material.dart';

class Category {
  String name;
  Color color;

  Category(this.name, this.color);

  static List<Category> categories = [
    Category("Food", Colors.red),
    Category("Clothes", Colors.green),
  ];

  static Category get defaultCategory {
    return categories.first;
  }
}
