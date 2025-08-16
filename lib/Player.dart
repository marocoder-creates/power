import 'package:flame/components.dart';
import 'package:power/entity.dart';

class Player extends Entity {
  Player({required Vector2 position})
    : super(position: position, size: Vector2.all(128));

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
    sprite = await Sprite.load('player_idle_0.png');
    for (var i = 1; i <= 10; ++i) {
      walk.add(await Sprite.load('player/Walk ($i).png'));
      run.add(await Sprite.load('player/Run ($i).png'));
      idle.add(await Sprite.load('player/Idle ($i).png'));
      attack.add(await Sprite.load('player/Attack ($i).png'));
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
