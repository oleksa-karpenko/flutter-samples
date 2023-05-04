import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'package:native_channel_sample/helpers/colors.dart';
import 'package:native_channel_sample/helpers/platform.dart';

const String channelID = 'com.oleksa/native_channel_sample';
const String methodGetMessage = 'getMessageFromNative';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const channel = MethodChannel(channelID);

  String _message = "Undefined";

  Future<void> _getMessage() async {
    String value = kIsWeb ? _getFlutterMessage() : await _getNativeMessage();

    setState(() {
      _message = value;
    });
  }

  String _getFlutterMessage() {
    return 'Hello from Dart!';
  }

  Future<String> _getNativeMessage() async {
    try {
      return await channel.invokeMethod(methodGetMessage);
    } on PlatformException catch (ex) {
      return 'Error on _getMessage(): ${ex.message}';
    }
  }

  void _clearState() {
    setState(() {
      _message = "Undefined";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Native Channel Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _getMessage,
              child: const Text('Get Message'),
            ),
            Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearState,
        tooltip: 'Clear State',
        child: const Icon(Icons.delete_forever),
      ),
      backgroundColor: getSwatchColor(platform).shade50,
    );
  }
}
