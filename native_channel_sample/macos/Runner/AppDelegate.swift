import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  
  override func applicationDidFinishLaunching(_ notification: Notification) {
    guard
      let mainWindow = mainFlutterWindow,
      let contentViewController = mainWindow.contentViewController,
      let controller = contentViewController as? FlutterViewController else {
      print("Something went wrong!")
      return
    }
    
    let channel = FlutterMethodChannel(
      name: "com.oleksa/native_channel_sample",
      binaryMessenger: controller.engine.binaryMessenger
    )
    channel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) -> Void in
      if call.method == "getMessageFromNative" {
        let value = self.getMessage()
        if value.isEmpty {
          let err = FlutterError(
            code: "MacOS native",
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
    
    super.applicationDidFinishLaunching(notification)
  }
  
  private func getMessage() -> String {
    "Hello from MacOS Native!"
  }
  
  override func applicationShouldTerminateAfterLastWindowClosed(
    _ sender: NSApplication
  ) -> Bool {
    return true
  }
}
