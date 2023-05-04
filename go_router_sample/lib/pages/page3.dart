import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page3Screen extends StatelessWidget {
  Page3Screen({Key? key}) : super(key: key) {
    print('Page3Screen has been created!');
  }

  @override
  Widget build(BuildContext context) {
    GoRouter r = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(r.location.toString())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Page three'),
            ElevatedButton(
              onPressed: () => context.go('/page3/page4'),
              child: const Text('Go to Page4'),
            ),
          ],
        ),
      ),
    );
  }
}
