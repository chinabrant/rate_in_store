import Flutter
import UIKit
import StoreKit

public class SwiftRateInStorePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "rate_in_store", binaryMessenger: registrar.messenger())
    let instance = SwiftRateInStorePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "rate" {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            // id557130558
            guard let appID = call.arguments as? String else {
                print("appid cannot be null")
                return
            }
            
            var components = URLComponents(url: URL(string: "https://itunes.apple.com/app/\(appID)")!, resolvingAgainstBaseURL: false)
            components?.queryItems = [
                URLQueryItem(name: "action", value: "write-review")
            ]
            guard let writeReviewURL = components?.url else {
                return
            }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(writeReviewURL)
            } else {
                UIApplication.shared.openURL(writeReviewURL)
            }
        }
    }
  }
}
