import 'package:flame/game.dart';
import 'package:flame_camera_practice/flame_camera_tools_example_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget.controlled(gameFactory: FlameCameraToolsExampleGame.new));
}
