import 'package:flutter/material.dart';
import '../screens/product_detail.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetail.routeName, arguments: product.id);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
            ),
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: null,
            ),
            backgroundColor: Colors.black45,
            title: Text(product.title, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
