import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:power/Player.dart';

class MyGame extends FlameGame with KeyboardEvents {
  MyGame({required super.world});

  late Player player;
  var deltaX = 0.0;
  var deltaY = 0.0;
  var speed = 1.0;
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
    final oldDeltaXSign = deltaX.sign;
    if (isKeyDown) {
      if (isRight) {
        deltaX = 1.0;
      }
      if (isLeft) {
        deltaX = -1.0;
      }
      if (isSpeed) {
        speed = 2.0;
      }
    }

    if (isKeyUp) {
      deltaX = 0.0;
      deltaY = 0.0;
      speed = 1;
    }
    if (deltaX.sign < 0) {
      player.transform.scale.x = -1.0 * player.transform.scale.x.abs();
    } else {
      player.transform.scale.x = player.transform.scale.x.abs();
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

    if (player.walk.length < 10 ||
        player.run.length < 10 ||
        player.idle.length < 10 ||
        player.attack.length < 10) {
      return;
    }

    player.position.add(Vector2(deltaX, deltaY) * 256.0 * dt * speed);
    player.anchor = Anchor.center;
    player.time -= (1 / player.walk.length) * dt * 15;

    if (player.time <= 0) {
      player.frame = (player.frame + player.framedir) % player.walk.length;
      player.time = 3.0 / player.walk.length;
      // if (player.frame >= player.walk.length) {
      //   player.frame -= 1;
      //   player.framedir = -1;
      // } else if (player.frame < 0) {
      //   player.frame = 0;
      //   player.framedir = 1;
      // }
      player.frame = (player.frame + player.framedir) % player.walk.length;
      player.framedir = 1;
    }
    if (deltaX != 0) {
      if (speed > 1) {
        player.sprite = player.run[player.frame];
      } else {
        player.sprite = player.walk[player.frame];
      }
    } else {
      player.sprite = player.idle[player.frame];
    }
  }
}
