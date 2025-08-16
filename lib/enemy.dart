import 'package:flame/components.dart';
import 'package:power/entity.dart';
import 'package:power/main.dart';

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
    MyWorld.totalToLoad += 2 * 8 + 12;
    for (var i = 0; i < 12; ++i) {
      idle.add(await Sprite.load('enemy/01-Idle/$i.png'));
      MyWorld.totalLoaded += 1;
    }
    for (var i = 0; i < 8; ++i) {
      walk.add(await Sprite.load('enemy/02-Walk/$i.png'));
      MyWorld.totalLoaded += 1;
      attack.add(await Sprite.load('enemy/03-Attack/$i.png'));
      MyWorld.totalLoaded += 1;
    }
    sprite = spriteList[0];
  }
}
