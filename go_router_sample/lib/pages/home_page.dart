import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(MyApp.appTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(MyApp.homeText),
            ElevatedButton(
              onPressed: () => context.go('/page2'),
              child: const Text('Go to page 2'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/page3');
              },
              child: const Text('Go to page 3'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/unknown_page');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
              child: const Text('Go to unknown page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/modal');
              },
              child: const Text('Open Modal Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/categories');
              },
              child: const Text('Open product categories'),
            ),
          ],
        ),
      ),
    );
  }
}
