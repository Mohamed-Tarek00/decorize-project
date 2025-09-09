import 'package:flutter/cupertino.dart';

class ScreenSize {
  static double getWidgetWidth({
    required double percantage,
    required BuildContext context,
  }) {
    return MediaQuery.of(context).size.width * percantage;
  }

  static double getWidgethighet({
    required double percantage,
    required BuildContext context,
  }) {
    return MediaQuery.of(context).size.height * percantage;
  }
}
