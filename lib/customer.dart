import 'dart:math';

import 'package:boong/boong.dart';

class Customer {
  int orderCount = Random().nextInt(3) + 1;
  int costs = 0;

  bool isOk() {
    return orderCount == 0;
  }

  void receiveBoong(BoongState state) {
    if (orderCount <= 0) {
      return;
    }
    orderCount--;
    switch (state) {
      case BoongState.undercooked:
        costs += 1000;
        break;
      case BoongState.wellCooked:
      case BoongState.burnt:
        costs += 500;
        break;
    }
  }
}
