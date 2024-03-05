import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'browser_details_method_channel.dart';

abstract class BrowserDetailsPlatform extends PlatformInterface {
  /// Constructs a BrowserDetailsPlatform.
  BrowserDetailsPlatform() : super(token: _token);

  static final Object _token = Object();

  static BrowserDetailsPlatform _instance = MethodChannelBrowserDetails();

  /// The default instance of [BrowserDetailsPlatform] to use.
  ///
  /// Defaults to [MethodChannelBrowserDetails].
  static BrowserDetailsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BrowserDetailsPlatform] when
  /// they register themselves.
  static set instance(BrowserDetailsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getBrowserBundle() async {
    final result = await instance.getBrowserBundle();
    return result;
  }
}
