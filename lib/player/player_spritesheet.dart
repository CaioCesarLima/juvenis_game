import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "player/idle_right.png",
    SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.15,
      textureSize: Vector2(6 * 16, 6 * 16),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "player/run_right.png",
    SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.15,
      textureSize: Vector2(6 * 16, 6 * 16),
    ),
  );

  static Future<SpriteAnimation> get runTop => SpriteAnimation.load(
    "player/run_up.png",
    SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.15,
      textureSize: Vector2(6 * 16, 6 * 16),
    ),
  );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
    "player/run_down.png",
    SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.15,
      textureSize: Vector2(6 * 16, 6 * 16),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: runRight,
        runUp: runTop,
        runDown: runDown,
      );
}
