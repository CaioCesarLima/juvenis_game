import 'package:bonfire/bonfire.dart';
import 'package:juvenis_bonfire/enemy/boss_base.dart';
import 'package:juvenis_bonfire/enemy/enemy_chef_spritesheet.dart';

class EnemyChef extends BossBase {
  EnemyChef({required super.position, required super.size, required super.name})
    : super(
        spritePath: 'enemy/idle.png',
        phaseNumber: 1,
        facePath: 'enemy/chef.png',
        spriteAnimationCustom: EnemyChefSpritesheet.simpleDirectionAnimation,
      );

  @override
  String getBossName() => "Chef";

  @override
  String getVictoryMessage() => "Você venceu dessa vez!";

  @override
  String getCorrectAnswerMessage() =>
      "Correto, mas não vou desistir tão facilmente!";

  @override
  String getWrongAnswerMessage() => "Errado!";

  @override
  String getInitialMessage() => "Veremos se será capaz de passar por mim!!";

  @override
  Future<SpriteAnimation> getHitAnimation() =>
      EnemyChefSpritesheet.hitAnimation;
}
