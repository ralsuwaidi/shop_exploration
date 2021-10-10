import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/product.dart';

import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavOnly;
  ProductsGrid(this.showFavOnly);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = showFavOnly
        ? Provider.of<Products>(context).favItems
        : Provider.of<Products>(context).items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
    );
  }
}
