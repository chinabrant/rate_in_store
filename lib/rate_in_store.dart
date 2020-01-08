import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
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

  static void rate({@required String appID}) async {
    if (Platform.isIOS) {
      _channel.invokeMethod('rate', appID);
    } else if (Platform.isAndroid) {
      launch('market://details?id=$appID');
    }    
  }
}
