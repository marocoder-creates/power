import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:power/entity.dart';
import 'package:power/main.dart';

class Enemy extends Entity {
  Enemy({required super.position})
    : super(size: Vector2.all(128), hpBarColor: Colors.green, maxHp: 800);

  @override
  double speed = 0.7;

  @override
  bool get isLoaded {
    var entity = this;
    return !(entity.walk.length < 8 ||
        entity.idle.length < 12 ||
        entity.attack.length < 8 ||
        entity.hurt.length < 8);
  }

  @override
  Future<void> onLoad() async {
    //sprite = await Sprite.load('enemy/01-Idle/__Bandit02_Idle_000.png');
    MyWorld.totalToLoad += 3 * 8 + 12;
    for (var i = 0; i < 12; ++i) {
      idle.add(await Sprite.load('enemy/01-Idle/$i.png'));
      MyWorld.totalLoaded += 1;
    }
    for (var i = 0; i < 8; ++i) {
      walk.add(await Sprite.load('enemy/02-Walk/$i.png'));
      MyWorld.totalLoaded += 1;
      attack.add(await Sprite.load('enemy/03-Attack/$i.png'));
      MyWorld.totalLoaded += 1;
      hurt.add(await Sprite.load('enemy/07-Hurt/$i.png'));
      MyWorld.totalLoaded += 1;
    }
    sprite = spriteList[0];
  }
}
