import 'package:flutter/material.dart';

// Helper method for defining color for given platform,
// just to distinguish between different platforms

MaterialColor getSwatchColor(String platform) {
  switch (platform) {
    case 'ios': return Colors.deepPurple;
    case 'macos': return Colors.indigo;
    case 'android': return Colors.yellow;
    case 'web': return Colors.green;
    default: return Colors.blue;
  }
}
