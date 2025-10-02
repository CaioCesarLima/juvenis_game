import 'package:flutter/material.dart';
import 'package:asp/asp.dart';
import 'package:juvenis_bonfire/game/fase03.dart';
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
            default:
              return const Fase01();
          }
        }
      },
    );
  }
}
