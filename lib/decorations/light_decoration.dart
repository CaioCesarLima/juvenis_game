import 'package:bonfire/bonfire.dart';
import 'package:juvenis_bonfire/player/player_hero.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';

class LightDecoration extends GameDecoration with Sensor<PlayerHero> {
  LightDecoration.withSprite({required super.position, required super.size})
    : super.withSprite(
        sprite: Sprite.load(
          "map/cave_ [resources].png",
          srcPosition: Vector2(112, 48),
          srcSize: Vector2(16, 16),
        ),
      );

  @override
  void onContact(PlayerHero component) {
    upgradeLight();
    removeFromParent();
    super.onContact(component);
  }
}
