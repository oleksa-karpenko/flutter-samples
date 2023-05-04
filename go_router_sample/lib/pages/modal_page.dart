import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ModalPage extends StatelessWidget {
  const ModalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This should be a fullscreen modal page'),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Back to home'),
            ),
          ],
        ),
      ),
    );
  }
}
