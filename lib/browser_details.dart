import 'dart:io';

import 'package:browser_details/entities/browser.dart';
import 'package:browser_details/exceptions/base_exception.dart';
import 'package:browser_details/exceptions/plataform_not_impemented_exception.dart';

import 'browser_details_platform_interface.dart';

class BrowserDetails {
  Future<Browser> getBrowser() async {
    try {
      if (!Platform.isAndroid) throw PlataformNotImplementedException();

      final resultBrowserBundle =
          await BrowserDetailsPlatform.instance.getBrowserBundle();

      return Browser.values.firstWhere(
        (browser) => browser.bundle == resultBrowserBundle,
        orElse: () => Browser.unknown,
      );
    } on BaseException catch (e, st) {
      throw BaseException(stackTrace: st);
    }
  }
}
