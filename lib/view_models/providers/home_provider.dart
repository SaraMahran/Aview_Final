import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  late  String _title;

  String get getTitle => _title;

  void setTitle(String title) {
    this._title = title;
    notifyListeners();
  }
}
