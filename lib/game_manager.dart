import 'package:boong/boong.dart';
import 'package:flutter/material.dart';

const int maxMoldCount = 9;
const int maxDisplayCount = 10;

class GameManager with ChangeNotifier {
  List<Boong> boongs = List.generate(maxMoldCount, (_) => Boong());
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
    if (displays.length >= maxDisplayCount) {
      return;
    }
    var maybe = boongs[index].determineBoongState();
    if (maybe != null) {
      displays.add(maybe);
    }
    boongs[index].resetMold();
    notifyListeners();
  }
}
