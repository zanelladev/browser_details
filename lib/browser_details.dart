import 'dart:io';

import 'browser_details_platform_interface.dart';
import 'entities/browser.dart';
import 'exceptions/base_exception.dart';
import 'exceptions/plataform_not_impemented_exception.dart';

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
