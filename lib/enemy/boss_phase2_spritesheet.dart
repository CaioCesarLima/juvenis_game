import 'package:bonfire/bonfire.dart';

class BossPhase2Spritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/idle_2.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(50, 50),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/idle_2.png",
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(24, 24),
      texturePosition: Vector2(26, 0),
    ),
  );

  static Future<SpriteAnimation> get hitAnimation => SpriteAnimation.load(
    "enemy/hit_2.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.10,
      textureSize: Vector2(50, 50),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}
