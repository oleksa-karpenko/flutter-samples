import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/products/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<Category> categories = Category.categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, idx) {
          Category category = categories[idx];

          return ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: ColoredBox(color: category.color),
                ),
              ],
            ),
            title: Text(category.name),
            style: ListTileStyle.list,
            onTap: () {
              context.goNamed(
                'products',
                pathParameters: <String, String>{
                  'category': category.name,
                },
                queryParameters: <String, String>{
                  'sort': 'asc',
                  'min_qty': '0',
                },
              );
            },
          );
        },
      ),
    );
  }
}
