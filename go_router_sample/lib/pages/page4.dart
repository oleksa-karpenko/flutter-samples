import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page4Screen extends StatelessWidget {
  Page4Screen({Key? key}) : super(key: key) {
    print('Page4Screen has been created!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fourth')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Page Four'),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}