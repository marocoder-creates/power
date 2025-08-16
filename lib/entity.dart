import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:power/e_anim_state.dart';

class Entity extends SpriteComponent {
  Entity({required Vector2 position, required Vector2 size})
    : super(position: position, size: Vector2.all(128));

  @override
  bool get isLoaded {
    return false;
  }

  List<Sprite> walk = [];
  List<Sprite> run = [];
  List<Sprite> idle = [];
  List<Sprite> attack = [];

  var deltaX = 0.0;
  var deltaY = 0.0;
  final double baseSpeed = 0.7;
  late var speed = 1.0;

  int frame = 0;
  double time = 1.0;
  int framedir = 1;
  EAnimState state = EAnimState.idle;

  List<Sprite> get spriteList {
    switch (state) {
      case EAnimState.idle:
        return idle;
      case EAnimState.walk:
        return walk;
      case EAnimState.attack:
        return attack;
      case EAnimState.run:
        return run;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    final entity = this;

    if (entity.deltaX.sign < 0) {
      entity.transform.scale.x = -1.0 * entity.transform.scale.x.abs();
    } else {
      entity.transform.scale.x = entity.transform.scale.x.abs();
    }

    entity.time -= (1 / entity.spriteList.length) * dt * 45;

    if (entity.time <= 0) {
      entity.frame =
          (entity.frame + entity.framedir) % entity.spriteList.length;
      entity.time = 3.0 / entity.spriteList.length;
      // if (player.frame >= player.walk.length) {
      //   player.frame -= 1;
      //   player.framedir = -1;
      // } else if (player.frame < 0) {
      //   player.frame = 0;
      //   player.framedir = 1;
      // }
      entity.framedir = 1;
    }

    entity.position.add(Vector2(deltaX, deltaY) * 256.0 * dt * speed);
    entity.anchor = Anchor.center;
    if (entity.frame < 0) {
      entity.frame = 0;
    }
    if (entity.frame >= entity.spriteList.length) {
      entity.frame = entity.spriteList.length - 1;
    }
    if (deltaX != 0) {
      if (speed > 1) {
        entity.sprite = entity.spriteList[entity.frame];
      } else {
        entity.sprite = entity.spriteList[entity.frame];
      }
    } else {
      entity.sprite = entity.spriteList[entity.frame];
    }
  }
}
