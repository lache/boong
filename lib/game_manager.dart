import 'package:boong/boong.dart';
import 'package:flutter/material.dart';

class GameManager with ChangeNotifier {
  List<Boong> boongs = List.generate(9, (_) => Boong());

  void addFlourToBoong(int index) {
    boongs[index].addFlour();
    notifyListeners();
  }

  void addRedBeanPasteToBoong(int index) {
    boongs[index].addRedBeanPaste();
    notifyListeners();
  }

  void cookBoong(int index) {
    boongs[index].cook();
    notifyListeners();
  }
}
