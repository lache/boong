import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:boong/boong.dart';
import 'package:boong/customer.dart';
import 'package:boong/player.dart';
import 'package:flutter/material.dart';

const int maxMoldCount = 9;
const int maxDisplayCount = 10;
const int maxCustomerCount = 5;

class GameManager with ChangeNotifier {
  final audioPlayerBgm = AudioPlayer();
  final audioPlayerSfx = AudioPlayer();
  Player player = Player();
  List<Boong> boongs = List.generate(maxMoldCount, (_) => Boong());
  Map<int, Timer> gasTimers = {};
  List<BoongState> displays = [];
  List<Customer> customers = [];
  bool customerSpawning = false;

  void addFlourToBoong(int index) {
    if (!customerSpawning) {
      requestToSpawnCustomer();
      customerSpawning = true;
    }

    if (!player.changeMoneyIfYouCan(-300)) {
      return;
    }
    if (!boongs[index].addFlour()) {
      return;
    }
    notifyListeners();
  }

  void addRedBeanPasteToBoong(int index) {
    if (!player.changeMoneyIfYouCan(-200)) {
      return;
    }
    if (!boongs[index].addRedBeanPaste()) {
      return;
    }
    notifyListeners();
  }

  void startCooking(int index) {
    if (!boongs[index].startCooking()) {
      return;
    }
    notifyListeners();

    gasTimers[index] = Timer.periodic(const Duration(seconds: 1), (timer) {
      player.changeMoneyIfYouCan(-50);
      notifyListeners();
    });
  }

  void finishCooking(int index) {
    gasTimers[index]?.cancel();
    if (!boongs[index].finishCooking()) {
      return;
    }
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

  void addCustomer() {
    if (customers.length < maxCustomerCount) {
      customers.add(Customer());
      notifyListeners();
    }
    requestToSpawnCustomer();
  }

  void requestToSpawnCustomer() {
    Future.delayed(Duration(seconds: Random().nextInt(10) + 5), () {
      addCustomer();
    });
  }

  void sellBoong(int index) {
    if (index >= displays.length) {
      return;
    }
    if (customers.isEmpty) {
      return;
    }

    var customer = customers[0];
    customer.receiveBoong(displays[index]);
    displays.removeAt(index);

    if (customer.isOk()) {
      player.addMoney(customer.costs);
      customers.removeAt(0);
    }

    notifyListeners();
  }
}
