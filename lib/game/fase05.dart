import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:juvenis_bonfire/decorations/life_decoration.dart';
import 'package:juvenis_bonfire/decorations/light_decoration.dart';
import 'package:juvenis_bonfire/decorations/speed_decoration.dart';
import 'package:juvenis_bonfire/decorations/tesouro_decoration.dart';
import 'package:juvenis_bonfire/enemy/boss_factory.dart';
import 'package:juvenis_bonfire/enemy/enemy_vilan.dart';
import 'package:juvenis_bonfire/game/fase01.dart';
import 'package:juvenis_bonfire/game/fase02.dart';
import 'package:juvenis_bonfire/game/game_controller.dart';
import 'package:juvenis_bonfire/player/player_hero.dart';
import 'package:juvenis_bonfire/store/chef/chef_atoms.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Fase05 extends StatefulWidget {
  const Fase05({super.key});

  @override
  State<Fase05> createState() => _Fase05State();
}

class _Fase05State extends State<Fase05> {
  late VoidCallback _listener;
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    reset();
    resetUser();
    _listener = () {};
    userLife.addListener(_listener);
  }

  @override
  void dispose() {
    userLife.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      lightingColorGame: Colors.black.withAlpha(255),
      collisionConfig: BonfireCollisionConfigDefault(),
      backgroundColor: Colors.blueGrey,
      components: [GameController()],

      // showCollisionArea: true,
      map: WorldMapByTiled(
        WorldMapReader.fromAsset('map/fase_5.tmj'),
        forceTileSize: Vector2(32, 32),
        objectsBuilder: {
          "enemy": (p) =>
              EnemyVilan(position: p.position, size: Vector2(24, 24)),
          "chef": (p) => BossFactory.createBoss(
            position: p.position,
            size: Vector2(160, 160),
            name: p.name!,
            phaseNumber: 5,
          ),
          "life": (p) =>
              LifeDecoration.withSprite(position: p.position, size: p.size),
          "light": (p) =>
              LightDecoration.withSprite(position: p.position, size: p.size),
          "speed": (p) =>
              SpeedDecoration.withSprite(position: p.position, size: p.size),
          "tesouro": (p) =>
              TesouroDecoration.withSprite(position: p.position, size: p.size),
        },
      ),
      cameraConfig: CameraConfig(
        speed: 3,
        zoom: getZoomFromMaxVisibleTile(context, 22, 22),
      ),
      playerControllers: [
        Keyboard(config: KeyboardConfig()),
        Joystick(
          directional: JoystickDirectional(
            alignment: Alignment.bottomRight,
            color: Colors.purple,
          ),
        ),
      ],
      overlayBuilderMap: {
        'navigation': (context, game) => const NavigationOverlay(),
        'ranking': (context, game) => const RankinButonOverlay(),
      },
      initialActiveOverlays: ['navigation', 'ranking'],

      player: PlayerHero(
        position: Vector2(35 * 16, 40 * 16),
        size: Vector2(96, 96),
      ),
    );
  }
}
