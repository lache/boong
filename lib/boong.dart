enum BoongState { undercooked, wellCooked, burnt }

enum BoongMoldState { empty, flour, redBean, startCooking, finishCooking }

class Boong {
  BoongMoldState moldState = BoongMoldState.empty;
  DateTime? startTime;
  int cookingTime = 0;

  bool addFlour() {
    if (moldState != BoongMoldState.empty) {
      return false;
    }
    moldState = BoongMoldState.flour;
    return true;
  }

  bool addRedBeanPaste() {
    if (moldState != BoongMoldState.flour) {
      return false;
    }
    moldState = BoongMoldState.redBean;
    return true;
  }

  bool startCooking() {
    if (moldState != BoongMoldState.redBean) {
      return false;
    }
    moldState = BoongMoldState.startCooking;
    startTime = DateTime.now();
    return true;
  }

  bool finishCooking() {
    if (moldState != BoongMoldState.startCooking) {
      return false;
    }
    moldState = BoongMoldState.finishCooking;
    final currentTime = DateTime.now();
    cookingTime = currentTime.difference(startTime!).inSeconds;
    startTime = null; // Reset start time for next cooking
    return true;
  }

  BoongState? determineBoongState() {
    if (moldState != BoongMoldState.finishCooking) {
      return null;
    }
    if (cookingTime < 5) {
      return BoongState.undercooked;
    } else if (cookingTime <= 8) {
      return BoongState.wellCooked;
    } else {
      return BoongState.burnt;
    }
  }

  void resetMold() {
    moldState = BoongMoldState.empty;
    startTime = null;
    cookingTime = 0;
  }
}
