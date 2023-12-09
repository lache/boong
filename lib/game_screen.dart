import 'package:boong/boong_widget.dart';
import 'package:boong/game_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GameManager>(
        builder: (context, manager, child) {
          return Column(
            children: [
              const Text("UI"),
              const Text("Customer"),
              buildDisplay(manager),
              buildMolds(manager),
              const Text("UI"),
            ],
          );
        },
      ),
    );
  }

  Widget buildDisplay(GameManager manager) => Row(
      children: manager.displays
          .map((item) => ElevatedButton(
              onPressed: () {},
              child: Image.asset('assets/boong${item.index}.png')))
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
