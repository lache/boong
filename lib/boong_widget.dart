import 'package:audioplayers/audioplayers.dart';
import 'package:boong/boong.dart';
import 'package:boong/game_manager.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class BoongWidget extends StatelessWidget {
  final Boong boong;
  final GameManager manager;
  final int index;

  const BoongWidget(this.boong, this.manager, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final moldAssetName = boong.moldState != BoongMoldState.finishCooking
        ? 'assets/mold${boong.moldState.index}.png'
        : 'assets/mold4-${boong.determineBoongState()!.index}.png';
    return Expanded(
      child: InkWell(
        onTap: handleAction,
        child: Card(
          child: Column(
            children: [
              //Text('Boong $index: ${boong.moldState}'),
              Expanded(child: Image.asset(moldAssetName)),
              //Text(getActionName()),
            ],
          ),
        ),
      ),
    );
  }

  void handleAction() {
    switch (boong.moldState) {
      case BoongMoldState.empty:
        audioPlayerSfx.play(AssetSource('flour.mp3'));
        manager.addFlourToBoong(index);
        break;
      case BoongMoldState.flour:
        audioPlayerSfx.play(AssetSource('redbean.mp3'));
        manager.addRedBeanPasteToBoong(index);
        break;
      case BoongMoldState.redBean:
        audioPlayerSfx.play(AssetSource('close.mp3'));
        manager.startCooking(index);
        break;
      case BoongMoldState.startCooking:
        audioPlayerSfx.play(AssetSource('sizzling.mp3'));
        manager.finishCooking(index);
        break;
      case BoongMoldState.finishCooking:
        audioPlayerSfx.play(AssetSource('ding.mp3'));
        manager.resetMold(index);
        break;
    }
  }

  String getActionName() {
    switch (boong.moldState) {
      case BoongMoldState.empty:
        return "Flour";
      case BoongMoldState.flour:
        return "Red Bean";
      case BoongMoldState.redBean:
        return "Start cooking";
      case BoongMoldState.startCooking:
        return "Finish";
      case BoongMoldState.finishCooking:
        return "Display";
    }
  }
}
