enum BoongState { undercooked, wellCooked, burnt }

enum BoongMoldState { empty, flour, redBean, startCooking, finishCooking }

class Boong {
  BoongMoldState moldState = BoongMoldState.empty;
  DateTime? startTime;
  int cookingTime = 0;

  void addFlour() {
    if (moldState == BoongMoldState.empty) {
      moldState = BoongMoldState.flour;
    }
  }

  void addRedBeanPaste() {
    if (moldState == BoongMoldState.flour) {
      moldState = BoongMoldState.redBean;
    }
  }

  void startCooking() {
    if (moldState == BoongMoldState.redBean) {
      moldState = BoongMoldState.startCooking;
      startTime = DateTime.now();
    }
  }

  void finishCooking() {
    if (moldState == BoongMoldState.startCooking) {
      moldState = BoongMoldState.finishCooking;
      final currentTime = DateTime.now();
      cookingTime = currentTime.difference(startTime!).inSeconds;
      startTime = null; // Reset start time for next cooking
    }
  }

  BoongState determineBoongState() {
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
