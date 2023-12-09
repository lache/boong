class Player {
  int money = 10000;

  bool changeMoneyIfYouCan(int delta) {
    if (money + delta < 0) {
      return false;
    }
    money += delta;
    return true;
  }

  void addMoney(int delta) {
    money += delta;
  }
}
