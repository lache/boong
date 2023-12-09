enum BoongState { Undercooked, WellCooked, Burnt }

class Boong {
  bool hasFlour = false;
  bool hasRedBeanPaste = false;
  DateTime? startTime = null;
  int cookingTime = 0;

  void addFlour() {
    if (!hasFlour) {
      hasFlour = true;
    }
  }

  void addRedBeanPaste() {
    if (hasFlour && !hasRedBeanPaste) {
      hasRedBeanPaste = true;
    }
  }

  void startCooking() {
    if (hasFlour && hasRedBeanPaste) {
      startTime = DateTime.now();
    }
  }

  void finishCooking() {
    if (startTime != null) {
      final currentTime = DateTime.now();
      cookingTime = currentTime.difference(startTime!).inSeconds;
      determineBungeoppangState();
      startTime = null; // Reset start time for next cooking
    }
  }

  BoongState determineBungeoppangState() {
    if (cookingTime < 5) {
      return BoongState.Undercooked;
    } else if (cookingTime <= 8) {
      return BoongState.WellCooked;
    } else {
      return BoongState.Burnt;
    }
  }

  void resetMold() {
    hasFlour = false;
    hasRedBeanPaste = false;
    startTime = null;
    cookingTime = 0;
  }
}
