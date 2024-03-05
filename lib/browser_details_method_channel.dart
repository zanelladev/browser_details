import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'browser_details_platform_interface.dart';

/// An implementation of [BrowserDetailsPlatform] that uses method channels.
class MethodChannelBrowserDetails extends BrowserDetailsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('browser_details');

  @override
  Future<String?> getBrowserBundle() async {
    final bundle = await methodChannel.invokeMethod<String>('getBrowserBundle');
    return bundle;
  }
}
