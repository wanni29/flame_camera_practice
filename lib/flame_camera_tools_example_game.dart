import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_camera_tools/flame_camera_tools.dart';
import 'package:flame_camera_practice/player.dart';
import 'package:flutter/material.dart';

class FlameCameraToolsExampleGame extends FlameGame
    with HasKeyboardHandlerComponents {
  final player = Player(position: Vector2.all(0), size: Vector2.all(50));

  @override
  FutureOr<void> onLoad() {
    world.add(player);

    final someComponent = RectangleComponent(
      position: Vector2.all(200),
      size: Vector2.all(100),
    );
    world.add(someComponent);

    camera.follow(player);

    // camera.smoothFollow(player, stiffness: 2);

    camera
        .shake(duration: 5, intensity: 20)
        .then(
          //after that focus the camera on 'someComponent' over a duration of 3 seconds with an easing curve
          (_) => camera.focusOnComponent(
            someComponent,
            duration: 3,
            curve: Curves.easeInOut,
          ),
        );

    camera.zoomTo(2, duration: 2);

    return super.onLoad();
  }
}
