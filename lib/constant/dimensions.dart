import 'package:flutter/widgets.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getFontSize(BuildContext context, double multiplier) {
  return MediaQuery.of(context).size.shortestSide * multiplier;
}
double getResponsivePadding(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage;
}
