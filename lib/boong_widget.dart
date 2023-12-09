import 'package:boong/boong.dart';
import 'package:boong/game_manager.dart';
import 'package:flutter/material.dart';

class BoongWidget extends StatelessWidget {
  final Boong boong;
  final GameManager manager;
  final int index;

  BoongWidget(this.boong, this.manager, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text('Boong $index: ${boong.status}'),
          ElevatedButton(
            onPressed: () => manager.addFlourToBoong(index),
            child: Text('Add Flour'),
          ),
          ElevatedButton(
            onPressed: () => manager.addRedBeanPasteToBoong(index),
            child: Text('Add Red Bean Paste'),
          ),
          ElevatedButton(
            onPressed: () => manager.cookBoong(index),
            child: Text('Cook'),
          ),
        ],
      ),
    );
  }
}
