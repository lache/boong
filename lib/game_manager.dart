import 'package:boong/boong.dart';
import 'package:flutter/material.dart';

class GameManager with ChangeNotifier {
  List<Boong> boongs = List.generate(9, (_) => Boong());
  List<BoongState> displays = [];

  void addFlourToBoong(int index) {
    boongs[index].addFlour();
    notifyListeners();
  }

  void addRedBeanPasteToBoong(int index) {
    boongs[index].addRedBeanPaste();
    notifyListeners();
  }

  void startCooking(int index) {
    boongs[index].startCooking();
    notifyListeners();
  }

  void finishCooking(int index) {
    boongs[index].finishCooking();
    notifyListeners();
  }

  void resetMold(int index) {
    var maybe = boongs[index].determineBoongState();
    if (maybe != null) {
      displays.add(maybe);
    }
    boongs[index].resetMold();
    notifyListeners();
  }
}
