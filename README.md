# rate_in_store

A Flutter rate plugin.

# How to use

```dart
RateInStore.rate(iOSAppID: 'id2343214123', androidAppID: 'com.xxx.xxx');
```

# On iOS

```swift
if #available(iOS 10.3, *) {
    SKStoreReviewController.requestReview()
} else {
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
```

# On Android

Use [url_launch](https://pub.dev/packages/url_launcher)

```dart
launch('market://details?id=$appID');
```