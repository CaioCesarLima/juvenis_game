import 'package:bonfire/bonfire.dart';

class BossPhase3Spritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/idle_3.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.15,
      textureSize: Vector2(62, 62),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/idle_3.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.15,
      textureSize: Vector2(64, 64),
    ),
  );

  static Future<SpriteAnimation> get hitAnimation => SpriteAnimation.load(
    "enemy/hit_3.png",
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.10,
      textureSize: Vector2(62, 62),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}

class BossPhase4Spritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/idle_5.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.15,
      textureSize: Vector2(6 * 16, 6 * 16),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/idle_5.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.15,
      textureSize: Vector2(6 * 16, 6 * 16),
    ),
  );

  static Future<SpriteAnimation> get hitAnimation => SpriteAnimation.load(
    "enemy/hit_5.png",
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.10,
      textureSize: Vector2(6 * 16, 6 * 16),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}

class BossPhase5Spritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/idle_4.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(40, 40),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/idle_4.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(40, 40),
    ),
  );

  static Future<SpriteAnimation> get hitAnimation => SpriteAnimation.load(
    "enemy/hit_4.png",
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.10,
      textureSize: Vector2(40, 40),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}

class BossPhase6Spritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/idle_6.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(50, 50),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/idle_6.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(50, 50),
    ),
  );

  static Future<SpriteAnimation> get hitAnimation => SpriteAnimation.load(
    "enemy/hit_6.png",
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.10,
      textureSize: Vector2(32, 32),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}

class BossPhase7Spritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/idle_7.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(50, 50),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/idle_7.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(50, 50),
    ),
  );

  static Future<SpriteAnimation> get hitAnimation => SpriteAnimation.load(
    "enemy/hit_7.png",
    SpriteAnimationData.sequenced(
      amount: 3,
      stepTime: 0.10,
      textureSize: Vector2(50, 50),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}

class BossPhase8Spritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/idle_8.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(62, 62),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/idle_8.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.15,
      textureSize: Vector2(62, 62),
    ),
  );

  static Future<SpriteAnimation> get hitAnimation => SpriteAnimation.load(
    "enemy/hit_8.png",
    SpriteAnimationData.sequenced(
      amount: 5,
      stepTime: 0.10,
      textureSize: Vector2(62, 62),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}

class BossPhase9Spritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/idle_9.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.15,
      textureSize: Vector2(68, 68),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/idle_9.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.15,
      textureSize: Vector2(68, 68),
    ),
  );

  static Future<SpriteAnimation> get hitAnimation => SpriteAnimation.load(
    "enemy/hit_9.png",
    SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.10,
      textureSize: Vector2(68, 68),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}

class BossPhase10Spritesheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    "enemy/idle_10.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.15,
      textureSize: Vector2(82, 82),
      texturePosition: Vector2(0, 0),
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    "enemy/idle_10.png",
    SpriteAnimationData.sequenced(
      amount: 6,
      stepTime: 0.15,
      textureSize: Vector2(68, 68),
    ),
  );

  static Future<SpriteAnimation> get hitAnimation => SpriteAnimation.load(
    "enemy/hit_10.png",
    SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.15,
      textureSize: Vector2(82, 82),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(idleRight: idleRight, runRight: runRight);
}
