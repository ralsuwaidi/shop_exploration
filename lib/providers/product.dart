import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    @required this.description,
    @required this.id,
    @required this.imageUrl,
    @required this.price,
    @required this.title,
    this.isFavourite = false,
  });

  void toggleFav() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
