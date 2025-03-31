import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_camera_practice/player.dart';
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
    camera = CameraComponent();
    // camera.viewport.position = player.position;

    camera.viewport = FixedResolutionViewport(resolution: Vector2(900, 400));
    camera.follow(player);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = Colors.black; // 원하는 배경색
    canvas.drawRect(Rect.largest, paint);

    super.render(canvas);
  }

  // @override
  // void update(double dt) {
  //   super.update(dt);

  //   final viewportWidth = camera.viewport.size.x;
  //   final viewportHeight = camera.viewport.size.y;
  //   final playerPosition = player.position;

  //   // 플레이어가 viewport 영역의 절반 이상을 벗어났을 때
  //   if (playerPosition.x < viewportWidth / 2 ||
  //       playerPosition.x > (size.x - viewportWidth / 2)) {
  //     // 카메라를 플레이어의 위치로 이동
  //     camera.moveTo(
  //       Vector2(
  //         playerPosition.x - viewportWidth / 2,
  //         camera.viewport.position.y,
  //       ),
  //     );
  //   }

  //   if (playerPosition.y < viewportHeight / 2 ||
  //       playerPosition.y > (size.y - viewportHeight / 2)) {
  //     camera.moveTo(
  //       Vector2(
  //         camera.viewport.position.x,
  //         playerPosition.y - viewportHeight / 2,
  //       ),
  //     );
  //   }
  // }
}
