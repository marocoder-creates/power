import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:power/MyGame.dart';
import 'package:power/Player.dart';
import 'package:power/enemy.dart';

void main() {
  runApp(GameWidget(game: MyGame(world: MyWorld())));
}

class MyWorld extends World {
  static int totalToLoad = 1;
  static int totalLoaded = 1;

  @override
  @override
  void update(double dt) {
    super.update(dt);
    final progress = totalLoaded / totalToLoad;
    if (children.length < 2) {
      return;
    }
    final tc =
        this.children.firstWhere((element) => element is TextComponent)
            as TextComponent;

    if (tc != null) {
      if (progress >= 1) {
        tc.text = "";
        return;
      }
      tc.text = "loading ${(progress * 100).toStringAsFixed(2)}%";
    }
  }

  @override
  Future<void> onLoad() async {
    add(
      SpriteComponent(
        sprite: await Sprite.load('bacon mockup.png'),
        anchor: Anchor.center,
        scale: Vector2.all(1.6),
        position: Vector2(0, 100),
      ),
    );
    add(
      TextComponent(
        text: "loading 0%",
        position: Vector2(0, 130),
        anchor: Anchor.center,
      ),
    );
    add(Player(position: Vector2(0, 0)));
    add(Enemy(position: Vector2(0 - Random().nextInt(600).toDouble(), 20)));
  }
}
