import 'dart:math';

import 'package:flame/input.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:power/Player.dart';
import 'package:power/blood_particle.dart';
import 'package:power/e_anim_state.dart';
import 'package:power/enemy.dart';
import 'package:power/entity.dart';

class MyGame extends FlameGame with KeyboardEvents, SingleGameInstance {
  MyGame({required super.world});

  late Player player;
  late Enemy enemy;
  var playerHealth = 1000;
  var enemyHealth = 800;
  var lastEnemyAttackTime = 0.0;
  var targetHealthbarScale = 1.0;
  var lastPlayerAttackTime = 0.0;
  var knockBack = 0.0;
  var playerKnockBack = 0.0;

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;
    final isKeyUp = event is KeyUpEvent;
    final isSpeed =
        keysPressed.contains(LogicalKeyboardKey.shiftLeft) ||
        keysPressed.contains(LogicalKeyboardKey.shiftRight);

    final isAttack =
        keysPressed.contains(LogicalKeyboardKey.space) ||
        keysPressed.contains(LogicalKeyboardKey.controlLeft) ||
        keysPressed.contains(LogicalKeyboardKey.controlRight);

    final isRight =
        keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
        keysPressed.contains(
          LogicalKeyboardKey("d".characters.first.codeUnitAt(0)),
        );
    final isLeft =
        keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
        keysPressed.contains(
          LogicalKeyboardKey("a".characters.first.codeUnitAt(0)),
        );

    if (isKeyDown) {
      if (isRight) {
        player.deltaX = 1.0;
        player.state = EAnimState.walk;
      }
      if (isLeft) {
        player.deltaX = -1.0;
        player.state = EAnimState.walk;
      }
      if (isSpeed) {
        player.speed = 2.0;
        player.state = EAnimState.run;
      }
    }

    if (isKeyUp) {
      player.deltaX = 0.0;
      player.deltaY = 0.0;
      player.speed = 1;
      player.state = EAnimState.idle;
    }
    if (isAttack) {
      player.state = EAnimState.attack;
    }

    return KeyEventResult.handled;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (world.children.isEmpty || world.children.length < 4) {
      return;
    }
    player =
        world.children.firstWhere((element) => element is Player) as Player;
    enemy = world.children.firstWhere((element) => element is Enemy) as Enemy;

    if (player.isLoaded == false || enemy.isLoaded == false) {
      return;
    }

    if ((player.position.x - enemy.position.x).abs() > 75) {
      enemy.state = EAnimState.walk;
      if (player.position.x > enemy.position.x) {
        enemy.deltaX = 1.0;
      } else {
        enemy.deltaX = -1.0;
      }
    } else {
      if (player.blinkTime > 0) {
        enemy.state = EAnimState.idle;
      } else {
        enemy.state = EAnimState.attack;
        enemy.deltaX = 0.0;

        lastEnemyAttackTime -= dt;
        if (lastEnemyAttackTime <= 0) {
          lastEnemyAttackTime = 0.7;
          player.takeDamage(200.0 + Random().nextInt(600));
          spawnParticles(player);
        }

        lastPlayerAttackTime -= dt;
        if (player.state == EAnimState.attack && lastPlayerAttackTime <= 0) {
          lastPlayerAttackTime = 0.3;
          enemy.takeDamage(300.0 + Random().nextInt(500));
          enemy.state = EAnimState.hurt;

          if (enemyHealth <= 0) {
          } else {
            if (enemy.position.x > player.position.x) {
              knockBack = 10;
            } else {
              knockBack = -10;
            }
          }
          spawnParticles(enemy);
        }
      }

      if (enemy.position.x < player.position.x) {
        enemy.transform.scale.x = enemy.transform.scale.x.abs();
      } else {
        enemy.transform.scale.x = -1.0 * enemy.transform.scale.x.abs();
      }
    }
    enemy.position.x += knockBack;
    knockBack *= 0.95;
    if (knockBack.abs() > 8) {
      spawnParticles(enemy);
    }
    if (player.state == EAnimState.attack || player.state == EAnimState.idle) {
      if (enemy.position.x > player.position.x) {
        player.transform.scale.x = player.transform.scale.x.abs();
      } else {
        player.transform.scale.x = -1.0 * player.transform.scale.x.abs();
      }
    }
  }

  void spawnParticles(Entity entity) {
    for (var i = 0; i < 20; ++i) {
      final particle = BloodParticle(
        mainColor: entity.hpBarColor,
        position: Vector2(entity.position.x, entity.position.y),
      );
      world.add(particle);
    }
  }
}
