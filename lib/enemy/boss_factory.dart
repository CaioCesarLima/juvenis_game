import 'package:bonfire/bonfire.dart';
import 'package:juvenis_bonfire/enemy/boss_base.dart';
import 'package:juvenis_bonfire/enemy/enemy_chef.dart';
import 'package:juvenis_bonfire/enemy/boss_phase2_spritesheet.dart';
import 'package:juvenis_bonfire/enemy/boss_phase3_spritesheet.dart';
import 'package:juvenis_bonfire/store/chef/chef_atoms.dart';

class BossFactory {
  static BossBase createBoss({
    required Vector2 position,
    required Vector2 size,
    required String name,
    required int phaseNumber,
  }) {
    reset();
    switch (phaseNumber) {
      case 1:
        return EnemyChef(position: position, size: size, name: name);
      case 2:
        return BossPhase2(position: position, size: size, name: name);
      case 3:
        return BossPhase3(position: position, size: size, name: name);
      case 4:
        return BossPhase4(position: position, size: size, name: name);
      case 5:
        return BossPhase5(position: position, size: size, name: name);
      case 6:
        return BossPhase6(position: position, size: size, name: name);
      case 7:
        return BossPhase7(position: position, size: size, name: name);
      case 8:
        return BossPhase8(position: position, size: size, name: name);
      case 9:
        return BossPhase9(position: position, size: size, name: name);
      case 10:
        return BossPhase10(position: position, size: size, name: name);
      // Adicione mais fases conforme necessário
      default:
        throw ArgumentError('Fase $phaseNumber não implementada');
    }
  }
}

// Boss da Fase 2
class BossPhase2 extends BossBase {
  BossPhase2({
    required super.position,
    required super.size,
    required super.name,
  }) : super(
         spritePath: 'enemy/idle_2.png',
         phaseNumber: 2,
         facePath: 'enemy/face_2.png',
         spriteAnimationCustom: BossPhase2Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Boss Fase 2";

  @override
  String getVictoryMessage() =>
      "Você me derrotou! Mas há outros mais fortes...";

  @override
  String getCorrectAnswerMessage() => "Boa resposta! Mas ainda não acabou!";

  @override
  String getWrongAnswerMessage() => "Errou! Tente novamente!";

  @override
  String getInitialMessage() => "Eu sou mais forte que o chef anterior!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase2Spritesheet.hitAnimation;
}

// Boss da Fase 3
class BossPhase3 extends BossBase {
  BossPhase3({
    required super.position,
    required super.size,
    required super.name,
  }) : super(
         spritePath: 'enemy/idle_3.png',
         phaseNumber: 3,
         facePath: 'enemy/face_3.png',
         spriteAnimationCustom: BossPhase3Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Boss Final";

  @override
  String getVictoryMessage() => "Parabéns! Você completou o jogo!";

  @override
  String getCorrectAnswerMessage() => "Impressionante! Mas eu sou o último!";

  @override
  String getWrongAnswerMessage() => "Falhou! Este é o seu fim!";

  @override
  String getInitialMessage() => "Eu sou o boss final! Ninguém passou por mim!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase3Spritesheet.hitAnimation;
}

class BossPhase4 extends BossBase {
  BossPhase4({
    required super.position,
    required super.size,
    required super.name,
  }) : super(
         spritePath: 'enemy/idle_3.png',
         phaseNumber: 3,
         facePath: 'enemy/face_4.png',
         spriteAnimationCustom: BossPhase4Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Boss Final";

  @override
  String getVictoryMessage() => "Parabéns! Você completou o jogo!";

  @override
  String getCorrectAnswerMessage() => "Impressionante! Mas eu sou o último!";

  @override
  String getWrongAnswerMessage() => "Falhou! Este é o seu fim!";

  @override
  String getInitialMessage() => "Eu sou o boss final! Ninguém passou por mim!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase4Spritesheet.hitAnimation;
}

class BossPhase5 extends BossBase {
  BossPhase5({
    required super.position,
    required super.size,
    required super.name,
  }) : super(
         spritePath: 'enemy/idle_3.png',
         phaseNumber: 3,
         facePath: 'enemy/face_3.png',
         spriteAnimationCustom: BossPhase5Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Boss Final";

  @override
  String getVictoryMessage() => "Parabéns! Você completou o jogo!";

  @override
  String getCorrectAnswerMessage() => "Impressionante! Mas eu sou o último!";

  @override
  String getWrongAnswerMessage() => "Falhou! Este é o seu fim!";

  @override
  String getInitialMessage() => "Eu sou o boss final! Ninguém passou por mim!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase5Spritesheet.hitAnimation;
}

class BossPhase6 extends BossBase {
  BossPhase6({
    required super.position,
    required super.size,
    required super.name,
  }) : super(
         spritePath: 'enemy/idle_3.png',
         phaseNumber: 3,
         facePath: 'enemy/face_3.png',
         spriteAnimationCustom: BossPhase6Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Boss Final";

  @override
  String getVictoryMessage() => "Parabéns! Você completou o jogo!";

  @override
  String getCorrectAnswerMessage() => "Impressionante! Mas eu sou o último!";

  @override
  String getWrongAnswerMessage() => "Falhou! Este é o seu fim!";

  @override
  String getInitialMessage() => "Eu sou o boss final! Ninguém passou por mim!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase6Spritesheet.hitAnimation;
}

class BossPhase7 extends BossBase {
  BossPhase7({
    required super.position,
    required super.size,
    required super.name,
  }) : super(
         spritePath: 'enemy/idle_3.png',
         phaseNumber: 3,
         facePath: 'enemy/face_3.png',
         spriteAnimationCustom: BossPhase7Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Boss Final";

  @override
  String getVictoryMessage() => "Parabéns! Você completou o jogo!";

  @override
  String getCorrectAnswerMessage() => "Impressionante! Mas eu sou o último!";

  @override
  String getWrongAnswerMessage() => "Falhou! Este é o seu fim!";

  @override
  String getInitialMessage() => "Eu sou o boss final! Ninguém passou por mim!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase7Spritesheet.hitAnimation;
}

class BossPhase8 extends BossBase {
  BossPhase8({
    required super.position,
    required super.size,
    required super.name,
  }) : super(
         spritePath: 'enemy/idle_3.png',
         phaseNumber: 3,
         facePath: 'enemy/face_3.png',
         spriteAnimationCustom: BossPhase8Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Boss Final";

  @override
  String getVictoryMessage() => "Parabéns! Você completou o jogo!";

  @override
  String getCorrectAnswerMessage() => "Impressionante! Mas eu sou o último!";

  @override
  String getWrongAnswerMessage() => "Falhou! Este é o seu fim!";

  @override
  String getInitialMessage() => "Eu sou o boss final! Ninguém passou por mim!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase8Spritesheet.hitAnimation;
}

class BossPhase9 extends BossBase {
  BossPhase9({
    required super.position,
    required super.size,
    required super.name,
  }) : super(
         spritePath: 'enemy/idle_3.png',
         phaseNumber: 3,
         facePath: 'enemy/face_3.png',
         spriteAnimationCustom: BossPhase9Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Boss Final";

  @override
  String getVictoryMessage() => "Parabéns! Você completou o jogo!";

  @override
  String getCorrectAnswerMessage() => "Impressionante! Mas eu sou o último!";

  @override
  String getWrongAnswerMessage() => "Falhou! Este é o seu fim!";

  @override
  String getInitialMessage() => "Eu sou o boss final! Ninguém passou por mim!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase9Spritesheet.hitAnimation;
}

class BossPhase10 extends BossBase {
  BossPhase10({
    required super.position,
    required super.size,
    required super.name,
  }) : super(
         spritePath: 'enemy/idle_3.png',
         phaseNumber: 3,
         facePath: 'enemy/face_3.png',
         spriteAnimationCustom: BossPhase10Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Boss Final";

  @override
  String getVictoryMessage() => "Parabéns! Você completou o jogo!";

  @override
  String getCorrectAnswerMessage() => "Impressionante! Mas eu sou o último!";

  @override
  String getWrongAnswerMessage() => "Falhou! Este é o seu fim!";

  @override
  String getInitialMessage() => "Eu sou o boss final! Ninguém passou por mim!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase10Spritesheet.hitAnimation;
}
