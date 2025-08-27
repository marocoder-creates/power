import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:power/entity.dart';
import 'package:power/main.dart';

class Player extends Entity {
  Player({required super.position})
    : super(size: Vector2.all(128), hpBarColor: Colors.green, maxHp: 1000);

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
    sprite = null;
    for (var i = 1; i <= 10; ++i) {
      walk.add(('player/Walk ($i).png'));
      MyWorld.totalLoaded += 1;
      run.add(('player/Run ($i).png'));
      MyWorld.totalLoaded += 1;
      idle.add(('player/Idle ($i).png'));
      MyWorld.totalLoaded += 1;
      attack.add(('player/Attack ($i).png'));
      MyWorld.totalLoaded += 1;
    }
    sprite = game.getSprite(idle[0]);
    super.onLoad();
  }
}
