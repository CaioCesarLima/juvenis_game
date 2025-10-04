import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:juvenis_bonfire/player/player_spritesheet.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';
import 'package:logger/logger.dart';

class PlayerHero extends SimplePlayer
    with Lighting, UseLifeBar, BlockMovementCollision {
  late VoidCallback _userProfileListener;
  late VoidCallback _upgradeLevel;

  PlayerHero({required super.position, required super.size})
    : super(
        animation: PlayerSpriteSheet.simpleDirectionAnimation,
        life: userLife.state.toDouble(),
        speed: 30 + ((userSpeed.state * 250) / 100),
      ) {
    setupLighting(
      LightingConfig(radius: getRadius(), color: Colors.white.withAlpha(10)),
    );
    setupLifeBar(
      size: Vector2(40, 6),
      backgroundColor: Colors.red,
      borderColor: Colors.black,
      showLifeText: true,
      borderRadius: BorderRadius.circular(5),

      offset: Vector2(0, 10),
      textStyle: TextStyle(color: Colors.white, fontSize: 4),
    );
  }

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: Vector2(25, 25), position: Vector2(35, 35)));

    // Sincroniza a vida inicial com o userLife
    Logger().i(
      "onLoad - initial sync: userLife=${userLife.state}, current life=$life",
    );
    updateLife(userLife.state.toDouble());
    Logger().i(
      "onLoad - after sync: userLife=${userLife.state}, current life=$life",
    );

    // Cria o listener para atualizar a iluminação e vida quando mudar
    _userProfileListener = () {
      // Atualiza a vida do player com o valor do atom
      final newLife = userLife.state.toDouble();
      Logger().i("DISPAROU AQUI: $newLife, current life: $life");

      // Só atualiza se a vida realmente mudou para evitar loops
      if ((newLife - life).abs() > 0.1) {
        updateLife(newLife);
        Logger().i("After updateLife: $newLife, current life: $life");
      }

      // Se a vida foi resetada e o player estava morto, reviver
      if (newLife > 0 && isDead) {
        // Forçar a reviver o player
        addLife(newLife);
      }
    };

    _upgradeLevel = () {
      setupLighting(
        LightingConfig(radius: getRadius(), color: Colors.white.withAlpha(10)),
      );
    };

    userLife.addListener(_userProfileListener);
    userLight.addListener(_upgradeLevel);
    return super.onLoad();
  }

  @override
  void onRemove() {
    // Remove o listener quando o componente for removido
    userLife.removeListener(_userProfileListener);
    super.onRemove();
  }

  double getRadius() {
    return (userLight.state * 10) + 40;
  }

  @override
  void onReceiveDamage(
    AttackOriginEnum origin,
    double damage,
    dynamic attacker,
  ) {
    Logger().i(
      "PlayerHero.onReceiveDamage - damage: $damage, current life: $life, userLife: ${userLife.state}",
    );
    // Executa a ação demage ANTES do super para sincronizar corretamente
    demage();
    Logger().i(
      "PlayerHero.onReceiveDamage - after demage() - life: $life, userLife: ${userLife.state}",
    );
    // Não chama super.onReceiveDamage para evitar duplicação de dano
    // O dano já foi aplicado através da ação demage()
  }
}
