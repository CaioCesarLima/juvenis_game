import 'package:flutter/material.dart';
import 'package:asp/asp.dart';
import 'package:juvenis_bonfire/game/fase03.dart';
import 'package:juvenis_bonfire/game/fase04.dart';
import 'package:juvenis_bonfire/game/fase05.dart';
import 'package:juvenis_bonfire/game/fase06.dart';
import 'package:juvenis_bonfire/game/fase07.dart';
import 'package:juvenis_bonfire/game/fase08.dart';
import 'package:juvenis_bonfire/game/fase09.dart';
import 'package:juvenis_bonfire/game/fase10.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';
import 'package:juvenis_bonfire/widgets/splash_screen.dart';
import 'package:juvenis_bonfire/game/fase01.dart';
import 'package:juvenis_bonfire/game/fase02.dart';

class GameRouter extends StatefulWidget {
  const GameRouter({super.key});

  @override
  State<GameRouter> createState() => _GameRouterState();
}

class _GameRouterState extends State<GameRouter> {
  @override
  void initState() {
    super.initState();
    // Finaliza o loading quando o GameRouter é criado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      finishLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AtomBuilder(
      builder: (_, get) {
        final loading = get(isLoading);
        final user = get(userName);

        // Se ainda está carregando ou não tem nome, mostra splash
        if (loading || user.isEmpty) {
          return const SplashScreen();
        } else {
          // Retorna a fase baseada no nível atual
          switch (get(userLevel)) {
            case UserLevels.fase_01:
              return const Fase01();
            case UserLevels.fase_02:
              return const Fase02();
            case UserLevels.fase_03:
              return const Fase03();
            case UserLevels.fase_04:
              return const Fase04();
            case UserLevels.fase_05:
              return const Fase05();
            case UserLevels.fase_06:
              return const Fase06();
            case UserLevels.fase_07:
              return const Fase07();
            case UserLevels.fase_08:
              return const Fase08();
            case UserLevels.fase_09:
              return const Fase09();
            case UserLevels.fase_10:
              return const Fase10();
          }
        }
      },
    );
  }
}
