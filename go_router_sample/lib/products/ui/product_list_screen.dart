import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/products/models/product_model.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.filterCategory, required this.sortAsc, required this.filterQty});

  final int filterQty;
  final String filterCategory;
  final bool sortAsc;

  List<Product> get products {
    var result = Product.products.where((p) => p.category == filterCategory).where((p) => p.qty >= filterQty).toList();

    result.sort((l, r) => l.name.compareTo(r.name));
    if (sortAsc == false) {
      return result.reversed.toList();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(filterCategory),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              String sort = !sortAsc ? 'asc' : 'desc';
              context.goNamed(
                'products',
                pathParameters: <String, String>{
                  'category': filterCategory,
                },
                queryParameters: <String, String>{
                  'sort': sort,
                },
              );
            },
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {
              context.goNamed(
                'products',
                pathParameters: <String, String>{
                  'category': filterCategory,
                },
                queryParameters: <String, String>{
                  'min_qty': '10',
                },
              );
            },
            icon: const Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final Product product in products)
            ListTile(
              title: Text(product.name),
              trailing: Text('${product.qty} pcs.'),
            ),
        ],
      ),
    );
  }
}
