import 'package:boong/game_manager.dart';
import 'package:boong/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameManager(),
      child: MaterialApp(home: GameScreen()),
    ),
  );
}
