import 'package:bonfire/bonfire.dart';
import 'package:juvenis_bonfire/enemy/enemy_spritesheet.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:juvenis_bonfire/store/chef/chef_atoms.dart';

class EnemyVilan extends SimpleEnemy {
  EnemyVilan({required super.position, required super.size})
    : super(
        life: 100,
        animation: EnemySpritesheet.simpleDirectionAnimation,
        speed: 15 + ((actualLevel.state * 250) / 100),
      );

  @override
  void update(double dt) {
    // Debug: verificar estado
    if (isPlayerNearChef.state) {
      print("Inimigo parado - jogador próximo ao chef");
    }

    // Só se move se o jogador não estiver próximo ao chef
    if (!isPlayerNearChef.state) {
      seeAndMoveToPlayer(
        closePlayer: (player) {
          simpleAttackMelee(damage: 0, size: size);
        },
        radiusVision: 128,
        visionAngle: 10,
      );
    } else {
      // Para o movimento quando próximo ao chef
      stopMove();
    }
    super.update(dt);
  }

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(20, 15),
        position: Vector2(2.5, 10),
        isSolid: true,
      ),
    );
    return super.onLoad();
  }
}
