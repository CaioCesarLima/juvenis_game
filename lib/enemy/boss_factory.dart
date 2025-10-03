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
  String getBossName() => "Chef Sombrio";

  @override
  String getVictoryMessage() =>
      "Impossível... Como você... O Mestre será avisado!";

  @override
  String getCorrectAnswerMessage() =>
      "Você tem sorte! Mas meus irmãos são mais cruéis!";

  @override
  String getWrongAnswerMessage() =>
      "Patético! Você não é digno de enfrentar o Mestre!";

  @override
  String getInitialMessage() =>
      "Ah, o primeiro a chegar até aqui... Prepare-se para conhecer o verdadeiro terror!";

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
  String getBossName() => "Guardião das Sombras";

  @override
  String getVictoryMessage() =>
      "Você... você realmente pode ser a esperança que esperávamos...";

  @override
  String getCorrectAnswerMessage() =>
      "Impressionante! Mas os próximos guardiões são imortais!";

  @override
  String getWrongAnswerMessage() => "Falhou! As sombras consomem os fracos!";

  @override
  String getInitialMessage() =>
      "Você chegou até aqui... Mas eu sou apenas o terceiro guardião. Há sete mais poderosos!";

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
  String getBossName() => "Senhor do Caos";

  @override
  String getVictoryMessage() =>
      "Não... como isso é possível? O Mestre Supremo será alertado!";

  @override
  String getCorrectAnswerMessage() =>
      "Você é habilidoso! Mas o caos sempre vence!";

  @override
  String getWrongAnswerMessage() => "O caos consome sua mente fraca!";

  @override
  String getInitialMessage() =>
      "Você derrotou três guardiões... Mas eu sou o Senhor do Caos! Prepare-se!";

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
         spritePath: 'enemy/idle_4.png',
         phaseNumber: 5,
         facePath: 'enemy/face_4.png',
         spriteAnimationCustom: BossPhase5Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Mestre da Destruição";

  @override
  String getVictoryMessage() =>
      "Incrível... Você pode realmente ser o escolhido...";

  @override
  String getCorrectAnswerMessage() =>
      "Excelente! Mas a destruição é inevitável!";

  @override
  String getWrongAnswerMessage() => "A destruição consome os fracos de mente!";

  @override
  String getInitialMessage() =>
      "Quatro guardiões caíram... Mas eu sou o Mestre da Destruição! Sua jornada termina aqui!";

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
         spritePath: 'enemy/idle_6.png',
         phaseNumber: 6,
         facePath: 'enemy/face_6.png',
         spriteAnimationCustom: BossPhase6Spritesheet.simpleDirectionAnimation,
       );

  @override
  String getBossName() => "Lorde da Escuridão";

  @override
  String getVictoryMessage() =>
      "Impossível... Cinco guardiões... Você é realmente especial...";

  @override
  String getCorrectAnswerMessage() => "Magnífico! Mas a escuridão é eterna!";

  @override
  String getWrongAnswerMessage() => "A escuridão devora sua alma fraca!";

  @override
  String getInitialMessage() =>
      "Cinco guardiões caíram diante de você... Mas eu sou o Lorde da Escuridão! Prepare-se para o verdadeiro terror!";

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
  String getBossName() => "Imperador do Vazio";

  @override
  String getVictoryMessage() =>
      "Seis guardiões... Você pode ser a única esperança restante...";

  @override
  String getCorrectAnswerMessage() => "Extraordinário! Mas o vazio é infinito!";

  @override
  String getWrongAnswerMessage() => "O vazio consome sua existência!";

  @override
  String getInitialMessage() =>
      "Seis guardiões caíram... Mas eu sou o Imperador do Vazio! Sua determinação será testada!";

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
  String getBossName() => "Rei da Perdição";

  @override
  String getVictoryMessage() =>
      "Sete guardiões... Você é realmente o escolhido...";

  @override
  String getCorrectAnswerMessage() => "Fantástico! Mas a perdição é absoluta!";

  @override
  String getWrongAnswerMessage() => "A perdição corrompe sua alma!";

  @override
  String getInitialMessage() =>
      "Sete guardiões caíram... Mas eu sou o Rei da Perdição! Prepare-se para enfrentar o poder supremo!";

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
  String getBossName() => "Arquimago Supremo";

  @override
  String getVictoryMessage() =>
      "Oito guardiões... Você pode realmente salvar nosso mundo...";

  @override
  String getCorrectAnswerMessage() =>
      "Incrível! Mas a magia suprema é invencível!";

  @override
  String getWrongAnswerMessage() => "A magia suprema destrói os indignos!";

  @override
  String getInitialMessage() =>
      "Oito guardiões caíram... Mas eu sou o Arquimago Supremo! Sua última prova antes do Mestre Final!";

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
  String getBossName() => "Mestre Final";

  @override
  String getVictoryMessage() =>
      "Incrível... Você derrotou todos os dez guardiões... Você é realmente o herói lendário que salvará nosso mundo!";

  @override
  String getCorrectAnswerMessage() =>
      "Extraordinário! Mas eu sou o Mestre Final! Prepare-se para o confronto definitivo!";

  @override
  String getWrongAnswerMessage() =>
      "Falhou! O poder do Mestre Final é absoluto!";

  @override
  String getInitialMessage() =>
      "Você derrotou todos os dez guardiões... Mas eu sou o Mestre Final! O último obstáculo entre você e a salvação do mundo!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      BossPhase10Spritesheet.hitAnimation;
}
