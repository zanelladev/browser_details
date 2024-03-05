import 'package:browser_details/browser_details_method_channel.dart';
import 'package:browser_details/browser_details_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBrowserDetailsPlatform
    with MockPlatformInterfaceMixin
    implements BrowserDetailsPlatform {
  @override
  Future<String?> getBrowserBundle() {
    // TODO: implement getBrowserBundle
    throw UnimplementedError();
  }
}

void main() {
  final BrowserDetailsPlatform initialPlatform =
      BrowserDetailsPlatform.instance;

  test('$MethodChannelBrowserDetails is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBrowserDetails>());
  });
}
