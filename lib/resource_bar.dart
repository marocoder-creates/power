import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:power/MyGame.dart';

class ResourceBar extends PositionComponent with HasGameReference<MyGame> {
  ResourceBar({
    required this.paint,
    required this.mainColor,
    super.position,
    super.angle,
    super.anchor,
    super.priority,
  });

  final Paint paint;
  final Color mainColor;
  final _w = 100;
  final _h = 10;

  late final List<Vector2> _vertices;

  double get scaleX => healthBar.transform.scale.x;
  set scaleX(double value) => healthBar.transform.scale.x = value;

  late final PolygonComponent healthBar;

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
        paint: Paint()..color = Colors.black,
      ),
    );
    final offset = 2.0;
    _vertices = getVertices(offset: offset);
    Paint paintBg = Paint()..color = (Colors.grey..withValues(alpha: 0.5));
    Paint paintFg = Paint()..color = (mainColor..withValues(alpha: 0.2));

    add(PolygonComponent(_vertices, anchor: Anchor.topLeft, paint: paintBg));
    add(
      healthBar = PolygonComponent(
        _vertices,
        anchor: Anchor.topLeft,
        paint: paintFg,
        position: Vector2(offset, offset),
      ),
    );
    return super.onLoad();
  }

  void tweenTo(double targetHealthbarScale) {
    scaleX += (targetHealthbarScale - scaleX) * 0.05;
    scaleX = clampDouble(scaleX, 0, 1);
  }
}
