import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_camera_practice/player.dart';
import 'package:flame_camera_tools/flame_camera_tools.dart';
import 'package:flutter/material.dart';

class FlameCameraToolsExampleGame extends FlameGame
    with HasKeyboardHandlerComponents {
  final player = Player(position: Vector2(450, 1500), size: Vector2.all(50));

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
      position: Vector2(200, 500),
      size: Vector2.all(250),
    );

    world.add(rectAngleComponent);

    final circleComponent1 = CircleComponent(
      radius: 100, // 반지름 설정
      position: Vector2(500, 1000), // 위치 설정
      paint:
          Paint()
            ..color = Colors.green
            ..style = PaintingStyle.fill, // 내부 채우기
    );

    world.add(circleComponent1);

    // 원형만 보여야 하는 라인
    final circleComponent2 = CircleComponent(
      radius: 100, // 반지름 설정
      position: Vector2(0, 1000), // 위치 설정
      paint:
          Paint()
            ..color = Colors.green
            ..style = PaintingStyle.fill, // 내부 채우기
    );

    world.add(circleComponent2);

    // 카메라 설정 로직
    camera.smoothFollow(
      player,
      stiffness: 100,
      deadZone: const Rect.fromLTRB(
        200,
        50, // 이 부분의 값을 조절하여 카메라를 조절하면 됨 !
        200,
        200,
      ), // (left, top, right, bottom)
    );

    // 카메라 설정 로직
    // camera.smoothFollow(
    //   player,
    //   stiffness: 1,
    // );

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.black; // 원하는 배경색
    canvas.drawRect(Rect.largest, paint);

    super.render(canvas);
  }
}
