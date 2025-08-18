import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:power/entity.dart';
import 'package:power/main.dart';

class Player extends Entity {
  Player({required super.position})
    : super(size: Vector2.all(128), hpBarColor: Colors.red, maxHp: 1000);

  @override
  bool get isLoaded {
    var player = this;
    return !(player.walk.length < 10 ||
        player.run.length < 10 ||
        player.idle.length < 10 ||
        player.attack.length < 10);
  }

  @override
  Future<void> onLoad() async {
    MyWorld.totalToLoad += 4 * 10;
    sprite = await Sprite.load('player_idle_0.png');
    for (var i = 1; i <= 10; ++i) {
      walk.add(await Sprite.load('player/Walk ($i).png'));
      MyWorld.totalLoaded += 1;
      run.add(await Sprite.load('player/Run ($i).png'));
      MyWorld.totalLoaded += 1;
      idle.add(await Sprite.load('player/Idle ($i).png'));
      MyWorld.totalLoaded += 1;
      attack.add(await Sprite.load('player/Attack ($i).png'));
      MyWorld.totalLoaded += 1;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
