import '../entities/browser.dart';

extension BrowserExtension on Browser {
  bool isChrome() => this == Browser.chrome;
  bool isFirefox() => this == Browser.firefox;
  bool isOpera() => this == Browser.opera;
  bool isEdge() => this == Browser.edge;
  bool isUnknown() => this == Browser.unknown;
}
