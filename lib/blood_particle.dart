import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:power/MyGame.dart';

class BloodParticle extends PositionComponent {
  BloodParticle({
    required this.mainColor,
    super.position,
    super.angle,
    super.anchor,
    super.priority,
  }) {
    var angle = Random().nextDouble() * 2 * pi;
    vx = cos(angle);
    vy = sin(angle);
    speed = 50.0 + Random().nextDouble() * 90;
    position.x += -35 + Random().nextDouble() * 70;
    position.y += -35 + Random().nextDouble() * 70;
  }

  final Color mainColor;
  final _w = 4;
  final _h = 4;

  var vx = 0.0;
  var vy = 0.0;
  var speed = 200.0;

  double get scaleX => transform.scale.x;
  set scaleX(double value) => transform.scale.x = value;

  List<Vector2> getVertices({double offset = 0.0}) {
    return [
      Vector2(0 + offset, _h - offset),
      Vector2(_w - offset, _h - offset),
      Vector2(_w - offset, 0 + offset),
      Vector2(0 + offset, 0 + offset),
    ];
  }

  @override
  FutureOr<void> onLoad() {
    add(
      PolygonComponent(
        getVertices(),
        anchor: Anchor.topLeft,
        paint: Paint()..color = mainColor,
      ),
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x += vx * speed * dt;
    position.y += vy * speed * dt;
    vy += 9 * dt;
    if (vy >= 4) {
      removeFromParent();
    }
  }
}
