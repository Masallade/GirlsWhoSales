import 'package:flutter/material.dart';

class JobDetailsStateManagement extends ChangeNotifier {
  bool _isBlurred = false;
  String? _imageUrl;

  bool get isBlurred => _isBlurred;
  String? get imageUrl => _imageUrl;

  void showImage(String url) {
    _isBlurred = true;
    _imageUrl = url;
    notifyListeners();
  }

  void hideImage() {
    _isBlurred = false;
    _imageUrl = null;
    notifyListeners();
  }
}
