// Place fonts/AppIcons.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: AppIcons
//      fonts:
//       - asset: fonts/AppIcons.ttf
import 'package:flutter/widgets.dart';

class AppIcons {
  AppIcons._();

  static const String _fontFamily = 'AppIcons';

  static const IconData conversations = IconData(
    0xe900,
    fontFamily: _fontFamily,
  );
  static const IconData menu = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData notifications = IconData(
    0xe902,
    fontFamily: _fontFamily,
  );
  static const IconData orders = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData package = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData wallet = IconData(0xe905, fontFamily: _fontFamily);
}
