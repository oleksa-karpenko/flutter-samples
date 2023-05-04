import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
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
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func getMessage() -> String {
    "Hello from iOS Native!"
  }
}
