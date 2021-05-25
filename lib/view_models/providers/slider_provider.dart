
import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  int _index = 0;
  PageController controller = PageController();

  int get getIndex => _index;

  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

