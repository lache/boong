import 'package:boong/boong_widget.dart';
import 'package:boong/game_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GameManager>(
        builder: (context, manager, child) {
          return Column(
            children: [
              const Text("UI"),
              buildCustomer(manager),
              buildDisplay(manager),
              buildMolds(manager),
              const Text("UI"),
            ],
          );
        },
      ),
    );
  }

  Widget buildCustomer(GameManager manager) => Row(
      children: manager.customers
          .map((customer) => ElevatedButton(
              onPressed: () {}, child: Text(customer.orderCount.toString())))
          .toList());

  Widget buildDisplay(GameManager manager) => Row(
      children: manager.displays
          .asMap()
          .entries
          .map((entry) => ElevatedButton(
              onPressed: () {
                manager.sellBoong(entry.key);
              },
              child: Image.asset('assets/boong${entry.value.index}.png')))
          .toList());

  Widget buildMolds(GameManager manager) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                buildMold(manager, 0),
                buildMold(manager, 1),
                buildMold(manager, 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildMold(manager, 3),
                buildMold(manager, 4),
                buildMold(manager, 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildMold(manager, 6),
                buildMold(manager, 7),
                buildMold(manager, 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoongWidget buildMold(GameManager manager, int index) =>
      BoongWidget(manager.boongs[index], manager, index);
}
