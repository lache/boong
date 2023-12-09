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
              const Text("Display"),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          BoongWidget(manager.boongs[0], manager, 0),
                          BoongWidget(manager.boongs[1], manager, 1),
                          BoongWidget(manager.boongs[2], manager, 2),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          BoongWidget(manager.boongs[3], manager, 3),
                          BoongWidget(manager.boongs[4], manager, 4),
                          BoongWidget(manager.boongs[5], manager, 5),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          BoongWidget(manager.boongs[6], manager, 6),
                          BoongWidget(manager.boongs[7], manager, 7),
                          BoongWidget(manager.boongs[8], manager, 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Text("UI"),
            ],
          );
        },
      ),
    );
  }
}
