import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:boong/boong_widget.dart';
import 'package:boong/game_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<GameManager>()
        .audioPlayerBgm
        .play(AssetSource('bgm${Random().nextInt(2)}.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GameManager>(
        builder: (context, manager, child) {
          return Column(
            children: [
              buildUI(manager),
              buildCustomer(manager),
              buildDisplay(manager),
              buildMolds(manager),
              const Text("BOONG"),
            ],
          );
        },
      ),
    );
  }

  Widget buildUI(GameManager manager) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/coin.png'),
          Text(manager.player.money.toString()),
        ],
      );

  Widget buildCustomer(GameManager manager) => SizedBox(
        height: 240,
        child: Row(
            children: manager.customers
                .map((customer) => Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/balloon.png'),
                                Center(
                                  child: Text(
                                    '${customer.orderCount.toString()}개 주세요.',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Image.asset(
                                  'assets/char${customer.index}.png')),
                        ],
                      ),
                    ))
                .toList()),
      );

  Widget buildDisplay(GameManager manager) => SizedBox(
        height: 120,
        child: Row(
            children: manager.displays
                .asMap()
                .entries
                .map((entry) => Expanded(
                      child: TextButton(
                          onPressed: () {
                            manager.sellBoong(entry.key);
                          },
                          child: Image.asset(
                              'assets/boong${entry.value.index}.png')),
                    ))
                .toList()),
      );

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
