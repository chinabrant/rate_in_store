import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// 打开Store的评分
class RateInStore {
  static const MethodChannel _channel =
      const MethodChannel('rate_in_store');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void rate({String iOSAppID, String androidAppID}) async {
    if (Platform.isIOS) {
      _channel.invokeMethod('rate', iOSAppID);
    } else if (Platform.isAndroid) {
      launch('market://details?id=$androidAppID');
    }    
  }
}
