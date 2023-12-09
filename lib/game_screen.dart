import 'package:boong/boong_widget.dart';
import 'package:boong/game_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Boong Tycoon')),
      body: Consumer<GameManager>(
        builder: (context, manager, child) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: manager.boongs.length,
            itemBuilder: (context, index) {
              return BoongWidget(manager.boongs[index], manager, index);
            },
          );
        },
      ),
    );
  }
}
