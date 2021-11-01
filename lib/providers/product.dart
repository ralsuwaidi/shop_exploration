import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool newVal) {
    isFavorite = newVal;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String id) {
    isFavorite = !isFavorite;
    final url = Uri.parse(
        'https://flutter-explore-ffcd0-default-rtdb.asia-southeast1.firebasedatabase.app/products/${id}.json');
    notifyListeners();

    return http.patch(
      url,
      body: json.encode(
        {
          'title': this.title,
          'description': this.description,
          'imageUrl': this.imageUrl,
          'price': this.price,
          'isFavorite': isFavorite,
        },
      ),
    );
  }
}
