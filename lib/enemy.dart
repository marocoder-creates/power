import 'package:flame/components.dart';
import 'package:power/entity.dart';

class Enemy extends Entity {
  Enemy({required Vector2 position})
    : super(position: position, size: Vector2.all(128));

  @override
  double speed = 0.7;

  @override
  bool get isLoaded {
    var player = this;
    return !(player.walk.length < 8 ||
        player.idle.length < 12 ||
        player.attack.length < 8);
  }

  @override
  Future<void> onLoad() async {
    //sprite = await Sprite.load('enemy/01-Idle/__Bandit02_Idle_000.png');
    for (var i = 0; i < 12; ++i) {
      idle.add(
        await Sprite.load(
          'enemy/01-Idle/__Bandit02_Idle_${i.toString().padLeft(3, '0')}.png',
        ),
      );
    }
    for (var i = 0; i < 8; ++i) {
      walk.add(
        await Sprite.load(
          'enemy/02-Walk/__Bandit02_Walk_${i.toString().padLeft(3, '0')}.png',
        ),
      );
      attack.add(
        await Sprite.load(
          'enemy/03-Attack/__Bandit02_Attack_${i.toString().padLeft(3, '0')}.png',
        ),
      );
    }
    sprite = spriteList[0];
  }
}
