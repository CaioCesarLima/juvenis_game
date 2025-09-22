import 'package:bonfire/bonfire.dart';
import 'package:juvenis_bonfire/enemy/enemy_spritesheet.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';

class EnemyVilan extends SimpleEnemy {
  EnemyVilan({required super.position, required super.size})
    : super(
        life: 100,
        animation: EnemySpritesheet.simpleDirectionAnimation,
        speed: 40,
      );

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        simpleAttackMelee(damage: 0, size: size);
      },
      radiusVision: 128,
      visionAngle: 10,
    );
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
