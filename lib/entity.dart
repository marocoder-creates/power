import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:power/MyGame.dart';
import 'package:power/e_anim_state.dart';
import 'package:power/resource_bar.dart';

class Entity extends SpriteComponent with HasGameReference<MyGame> {
  Entity({
    required Vector2 position,
    required Vector2 size,
    required this.hpBarColor,
    required this.maxHp,
  }) : super(position: position, size: Vector2.all(128)) {
    anchor = Anchor.center;
    add(
      hpBarShape = ResourceBar(
        anchor: Anchor.topLeft,
        position: Vector2.zero(),
        paint: Paint()..color = (hpBarColor..withValues(alpha: 0.7)),
        mainColor: hpBarColor..withValues(alpha: 0.7),
      ),
    );
  }

  @override
  bool get isLoaded {
    return false;
  }

  List<String> walk = [];
  List<String> run = [];
  List<String> idle = [];
  List<String> attack = [];
  List<String> hurt = [];

  late final ResourceBar hpBarShape;
  Color hpBarColor;

  double maxHp = 1000;
  late double hp = 1000;

  var deltaX = 0.0;
  var deltaY = 0.0;
  final double baseSpeed = 0.7;
  late var speed = 1.0;

  int frame = 0;
  double time = 1.0;
  int framedir = 1;
  EAnimState _state = EAnimState.idle;
  double blinkTime = 0;

  set state(EAnimState value) {
    if (_state == EAnimState.hurt && value != EAnimState.hurt) {
      return;
    }

    _state = value;
    if (_state == EAnimState.hurt) {
      frame = 0;
    }
  }

  EAnimState get state => _state;

  List<String> get spriteList {
    switch (state) {
      case EAnimState.idle:
        return idle;
      case EAnimState.walk:
        return walk;
      case EAnimState.attack:
        return attack;
      case EAnimState.run:
        return run;
      case EAnimState.hurt:
        return hurt;
    }
  }

  @override
  FutureOr<void> onLoad() {
    hp = maxHp;

    return super.onLoad();
  }

  void takeDamage(double damage) {
    hp -= damage;
    if (hp <= 0) {
      hp = maxHp;
      state = EAnimState.idle;
    } else {
      blinkTime = 2;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    hpBarShape.tweenTo(hp / maxHp);

    blinkTime -= dt;
    if (blinkTime <= 0) {
      blinkTime = 0;
      opacity = 1;
    } else {
      if ((blinkTime * 10).toInt() % 4 == 0) {
        opacity = 0.8;
      } else {
        opacity = 1;
      }
    }

    final entity = this;

    if (entity.deltaX.sign < 0) {
      entity.transform.scale.x = -1.0 * entity.transform.scale.x.abs();
    } else {
      entity.transform.scale.x = entity.transform.scale.x.abs();
    }

    entity.time -= (1 / entity.spriteList.length) * dt * 45;

    if (entity.time <= 0) {
      if (entity.frame + entity.framedir < 0 ||
          entity.frame + entity.framedir >= entity.spriteList.length) {
        if (_state == EAnimState.hurt) {
          _state = EAnimState.idle;
          entity.frame = 0;
        }
      }
      entity.frame =
          (entity.frame + entity.framedir) % entity.spriteList.length;
      entity.time = 3.0 / entity.spriteList.length;
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
        entity.sprite = game.getSprite(entity.spriteList[entity.frame]);
      } else {
        entity.sprite = game.getSprite(entity.spriteList[entity.frame]);
      }
    } else {
      entity.sprite = game.getSprite(entity.spriteList[entity.frame]);
    }
    if (isLoaded) {
      hpBarShape.transform.position.x = 0;
      hpBarShape.transform.position.y = -12;
    }
  }
}
