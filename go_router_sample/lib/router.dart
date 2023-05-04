import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:go_router_sample/pages/error_page.dart';
import 'package:go_router_sample/pages/home_page.dart';
import 'package:go_router_sample/pages/modal_page.dart';
import 'package:go_router_sample/pages/page2.dart';
import 'package:go_router_sample/pages/page3.dart';
import 'package:go_router_sample/pages/page4.dart';
import 'package:go_router_sample/products/models/category_model.dart';

import 'package:go_router_sample/products/ui/category_screen.dart';
import 'package:go_router_sample/products/ui/product_list_screen.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: 'page2',
          builder: (context, state) => const Page2(),
        ),
        GoRoute(path: 'page3', builder: (context, state) => Page3Screen(), routes: [
          GoRoute(
            path: 'page4',
            builder: (context, state) => Page4Screen(),
          ),
        ]),
        GoRoute(
          path: 'modal',
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: ModalPage(),
          ),
        ),

        // Categories & Products
        GoRoute(path: 'categories', builder: (context, GoRouterState state) => CategoryScreen(), routes: [
          /// -> /categories/products/{category}?sort=asc&min_qty=0
          /// -> /categories/products/Clothes?sort=asc&min_qty=0
          GoRoute(
            name: 'products',
            path: 'products/:category',
            builder: (context, state) => ProductListScreen(
              filterCategory: state.pathParameters['category'] ?? Category.defaultCategory.name,
              sortAsc: state.queryParameters['sort'] == 'asc',
              filterQty: int.parse(state.queryParameters['min_qty'] ?? '0'), // show all
            ),
          ),
        ]),
      ],
    )
  ],
  errorBuilder: (context, state) => ErrorPage(
    errorMessage: state.error.toString(),
  ),
);
