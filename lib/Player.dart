import 'package:flame/components.dart';

class Player extends SpriteComponent {
  Player({required Vector2 position})
    : super(position: position, size: Vector2.all(128));

  List<Sprite> walk = [];
  List<Sprite> run = [];
  List<Sprite> idle = [];
  List<Sprite> attack = [];

  int frame = 0;
  double time = 1.0;
  int framedir = 1;

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
}
