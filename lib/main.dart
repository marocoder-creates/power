import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:power/MyGame.dart';
import 'package:power/Player.dart';

void main() {
  runApp(GameWidget(game: MyGame(world: MyWorld())));
}

class MyWorld extends World {
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
    add(Player(position: Vector2(0, 0)));
  }
}
