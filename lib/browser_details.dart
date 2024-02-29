library browser_details;

import 'dart:io';

import 'package:flutter/services.dart';

import 'entities/browser.dart';
import 'exceptions/base_exception.dart';
import 'exceptions/plataform_not_impemented_exception.dart';

export 'entities/browser.dart';

class BrowserDetails {
  Future<Browser> getBrowser() async {
    try {
      if (!Platform.isAndroid) throw PlataformNotImplementedException();

      const MethodChannel platformChannel = MethodChannel('browser_details');

      final String resultBrowserBundle =
          await platformChannel.invokeMethod('getBrowser');

      return Browser.values.firstWhere(
        (browser) => browser.bundle == resultBrowserBundle,
        orElse: () => Browser.unknown,
      );
    } on BaseException catch (e, st) {
      throw BaseException(stackTrace: st);
    }
  }
}
