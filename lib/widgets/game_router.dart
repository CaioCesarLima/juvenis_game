import 'package:flutter/material.dart';
import 'package:asp/asp.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:juvenis_bonfire/widgets/splash_screen.dart';
import 'package:juvenis_bonfire/game/fase01.dart';
import 'package:juvenis_bonfire/game/fase02.dart';

class GameRouter extends StatelessWidget {
  const GameRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return AtomBuilder(
      builder: (_, get) {
        final loading = get(isLoading);

        if (loading) {
          return const SplashScreen();
        } else {
          // Retorna a fase baseada no nível atual
          switch (get(userLevel)) {
            case UserLevels.fase_01:
              return const Fase01();
            case UserLevels.fase_02:
              return const Fase02();
            default:
              return const Fase01();
          }
        }
      },
    );
  }
}
