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
  final double followAreaSize = 1000; // 카메라가 유지할 영역 크기

  @override
  FutureOr<void> onLoad() {
    world.add(player);

    // 삼각형만 보여야 하는 라인
    final triAngleComponent1 = PolygonComponent(
      [
        Vector2(0, 0),
        Vector2(150, 0),
        Vector2(75, -100), // 위로 뾰족한 삼각형
      ],
      paint: Paint()..color = Colors.blue,
      position: Vector2.zero(),
    );

    world.add(triAngleComponent1);

    final triAngleComponent2 = PolygonComponent(
      [
        Vector2(0, 0),
        Vector2(150, 0),
        Vector2(75, -100), // 위로 뾰족한 삼각형
      ],
      paint: Paint()..color = Colors.blue,
      position: Vector2(500, 0),
    );

    world.add(triAngleComponent2);

    // 사각형만 보여야 하는 라인
    final rectAngleComponent = RectangleComponent(
      position: Vector2.all(200),
      size: Vector2.all(250),
    );

    world.add(rectAngleComponent);

    final circleComponent1 = CircleComponent(
      radius: 100, // 반지름 설정
      position: Vector2.all(500), // 위치 설정
      paint:
          Paint()
            ..color = Colors.green
            ..style = PaintingStyle.fill, // 내부 채우기
    );

    world.add(circleComponent1);

    // 원형만 보여야 하는 라인
    final circleComponent2 = CircleComponent(
      radius: 100, // 반지름 설정
      position: Vector2(0, 500), // 위치 설정
      paint:
          Paint()
            ..color = Colors.green
            ..style = PaintingStyle.fill, // 내부 채우기
    );

    world.add(circleComponent2);

    camera.smoothFollow(player, stiffness: 1);

    return super.onLoad();
  }
}
