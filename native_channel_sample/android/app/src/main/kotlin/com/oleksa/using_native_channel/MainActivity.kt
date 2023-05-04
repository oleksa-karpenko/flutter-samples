package com.oleksa.native_channel_sample

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val channel = "com.oleksa/native_channel_sample"

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger,  channel)
      .setMethodCallHandler { call, result ->
        if (call.method == "getMessageFromNative") {
          val value = getMessage()
          if (value.isEmpty()) {
            result.error("A-NATIVE", "message is empty", null)
          } else {
            result.success(value)
          }
        } else {
          result.notImplemented()
        }
      }
  }

  private fun getMessage(): String {
    val value = "Hello from Android Native!"
    return value
  }
}
