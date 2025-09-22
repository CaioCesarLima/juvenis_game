import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:juvenis_bonfire/decorations/life_decoration.dart';
import 'package:juvenis_bonfire/decorations/light_decoration.dart';
import 'package:juvenis_bonfire/decorations/speed_decoration.dart';
import 'package:juvenis_bonfire/decorations/tesouro_decoration.dart';
import 'package:juvenis_bonfire/enemy/enemy_chef.dart';
import 'package:juvenis_bonfire/enemy/enemy_vilan.dart';
import 'package:juvenis_bonfire/game/game_controller.dart';
import 'package:juvenis_bonfire/player/player_hero.dart';
import 'package:juvenis_bonfire/store/chef/chef_atoms.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:asp/asp.dart';

class Fase02 extends StatefulWidget {
  const Fase02({super.key});

  @override
  State<Fase02> createState() => _Fase02State();
}

class _Fase02State extends State<Fase02> {
  late VoidCallback _listener;

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
      // showCollisionArea: true,
      components: [GameController()],

      map: WorldMapByTiled(
        WorldMapReader.fromAsset('map/fase_2.tmj'),
        forceTileSize: Vector2(
          32,
          32,
        ), // Corrigindo para o tamanho real dos tiles
        objectsBuilder: {
          "enemy": (p) =>
              EnemyVilan(position: p.position, size: Vector2(24, 24)),
          "chef": (p) => EnemyChef(
            position: p.position,
            size: Vector2(96, 96),
            name: p.name!,
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
        zoom: getZoomFromMaxVisibleTile(
          context,
          22,
          22,
        ), // Ajustando zoom para tiles menores
      ),
      playerControllers: [
        Keyboard(config: KeyboardConfig()),
        Joystick(
          directional: JoystickDirectional(alignment: Alignment.bottomRight),
        ),
      ],
      overlayBuilderMap: {
        'navigation': (context, game) => const NavigationOverlay(),
      },
      initialActiveOverlays: ['navigation'],
      player: PlayerHero(
        position: Vector2(
          10 * 32,
          31 * 32,
        ), // Ajustando posição para tiles menores
        size: Vector2(96, 96),
      ),
    );
  }
}

class NavigationOverlay extends StatelessWidget {
  const NavigationOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          top: true,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AtomBuilder(
                  builder: (_, get) {
                    print("foi atualizado");
                    return Text(
                      userName.state,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                AtomBuilder(
                  builder: (_, get) {
                    print("foi ${userLevel.state.name()}");
                    return Text(
                      'Nível: ${actualLevel.state}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                AtomBuilder(
                  builder: (_, get) {
                    final score = get(userScore);
                    print("Score atual: $score");
                    return Text(
                      'Pontuação: $score',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    int userLevelFase = userLevel.state.toInt();
                    if (userLevelFase > 1) {
                      decreaseLevel();

                      Navigator.of(
                        context,
                      ).pushReplacementNamed(userLevel.state.toRoute());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Nível Anterior'),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    int userLevelFase = userLevel.state.toInt();
                    int levelActual = actualLevel.state;
                    if (userLevelFase < levelActual) {
                      upgradeLevel();

                      Navigator.of(
                        context,
                      ).pushReplacementNamed(userLevel.state.toRoute());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Próximo Nível'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
