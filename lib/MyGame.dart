import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:power/Player.dart';
import 'package:power/e_anim_state.dart';
import 'package:power/enemy.dart';

class MyGame extends FlameGame with KeyboardEvents {
  MyGame({required super.world});

  late Player player;
  late Enemy enemy;

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

    return KeyEventResult.handled;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (world.children.isEmpty || world.children.length < 2) {
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
      enemy.state = EAnimState.attack;
      enemy.deltaX = 0.0;
      if (enemy.position.x < player.position.x) {
        enemy.transform.scale.x = enemy.transform.scale.x.abs();
      } else {
        enemy.transform.scale.x = -1.0 * enemy.transform.scale.x.abs();
      }
    }
  }
}
