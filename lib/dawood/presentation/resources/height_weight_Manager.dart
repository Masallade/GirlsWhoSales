import 'package:flutter/material.dart';

class HeightWidthManager {
  final BuildContext context;

  HeightWidthManager(this.context);

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}
