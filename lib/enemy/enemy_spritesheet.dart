import 'package:bonfire/bonfire.dart';

class EnemySpritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/slime_green.png",
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24, 24),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/slime_green.png",
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(26, 0),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}
