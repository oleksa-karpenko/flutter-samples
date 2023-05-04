import 'dart:io';
import 'package:flutter/foundation.dart';

String get platform => kIsWeb ? 'web' : Platform.operatingSystem;
