import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Player extends RectangleComponent with KeyboardHandler {
  Player({super.position, super.size})
    : super(paint: Paint()..color = Colors.red);

  Set<LogicalKeyboardKey> _keys = {};
  final double _movementSpeed = 300;

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _keys = keysPressed;
    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    super.update(dt);

    final direction = Vector2.zero();

    if (_keys.contains(LogicalKeyboardKey.keyW)) {
      direction.y = -1;
    }

    if (_keys.contains(LogicalKeyboardKey.keyA)) {
      direction.x = -1;
    }
    if (_keys.contains(LogicalKeyboardKey.keyS)) {
      direction.y = 1;
    }

    if (_keys.contains(LogicalKeyboardKey.keyD)) {
      direction.x = 1;
    }

    if (!direction.isZero()) {
      direction.normalize();
      position += direction * _movementSpeed * dt;
    }
  }
}
