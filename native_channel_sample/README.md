# native_channel_sample

This is a very simple Flutter project that shows how to work with native code.

We need to define the MethodChannel through which we can communicate with the Native implementations

### Flutter side
```dart
const String channelID = 'com.oleksa/native_channel_sample';
const String methodGetMessage = 'getMessageFromNative';

const channel = MethodChannel(channelID);
try {
  return await channel.invokeMethod(methodGetMessage);
} on PlatformException catch (ex) {
  return 'Error: ${ex.message}';
}
```
### Native side 
```swift
let controller = window?.rootViewController as! FlutterViewController
let channel = FlutterMethodChannel(
  name: "com.oleksa/native_channel_sample",
  binaryMessenger: controller.binaryMessenger
)
channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) -> Void in
  if call.method == "getMessageFromNative" {
    let value = self.getMessage()
    if value.isEmpty {
      let err = FlutterError(
        code: "iOS native",
        message: "Message is empty",
        details: nil
      )
      result(err)
    } else {
      result(value)
    }
  } else {
    result(FlutterMethodNotImplemented)
  }
}
    
GeneratedPluginRegistrant.register(with: self)
```
![screenshot](https://raw.githubusercontent.com/oleksa-karpenko/flutter-samples/main/native_channel_sample/screenshot.png)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
