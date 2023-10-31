import UIKit
import SwiftUI
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      var controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let methdodChannel = FlutterMethodChannel(name: "testChannel",
                                                binaryMessenger: controller.binaryMessenger)
      methdodChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          var controller = UIHostingController(rootView: AddCardView())
          self.window?.rootViewController?.present(controller , animated: true, completion: nil)
      })
      GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
