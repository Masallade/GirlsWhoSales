import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/resources/color_manager.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';

class AboutUsStateManagement extends ChangeNotifier {
  Color _animateColor = ColorManager.pinkPrimary;

  Color get animateColor => _animateColor;

  void changeColor() {
    _animateColor = _animateColor == ColorManager.pinkPrimary ? ColorManager.pinkPrimary.withOpacity(AppSize.s03) : ColorManager.pinkPrimary;
    notifyListeners();
  }
}
