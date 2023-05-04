import 'package:flutter/material.dart';
import 'package:native_channel_sample/home_page.dart';

import 'package:native_channel_sample/helpers/colors.dart';
import 'package:native_channel_sample/helpers/platform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Native Channel Demo',
      theme: ThemeData(
        primarySwatch: getSwatchColor(platform),
      ),
      home: const HomePage(),
    );
  }
}
