import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:juvenis_bonfire/store/chef/chef_atoms.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TesouroDecoration extends GameDecoration with TapGesture {
  bool _isOpen = false;
  final supabase = Supabase.instance.client;

  TesouroDecoration.withSprite({required super.position, required super.size})
    : super.withSprite(
        sprite: Sprite.load(
          "map/cave_ [resources].png",
          srcPosition: Vector2(48, 80), // Posição inicial (x=48, y=80)
          srcSize: Vector2(32, 32), // 2x2 tiles (16*2 = 32 pixels)
        ),
      );

  @override
  void onTap() {
    gameRef.pauseEngine();
    gameRef.player!.stopMove();

    if (chefLife.state > 0) {
      TalkDialog.show(
        context,
        [
          Say(
            text: [
              TextSpan(text: "Precisa vencer o chef para abrir o tesouro."),
            ],
          ),
        ],
        backgroundColor: Colors.transparent,
        dismissible: true,
        onClose: () {
          gameRef.resumeEngine();
        },
      );
    } else {
      TalkDialog.show(
        context,
        [
          Say(text: [TextSpan(text: "Parabéns por sua vitória!")]),
        ],
        backgroundColor: Colors.transparent,
        dismissible: true,
        onClose: () {
          _openTreasure();
          gameRef.resumeEngine();
        },
      );
    }
  }

  /// Método para abrir o tesouro
  Future<void> _openTreasure() async {
    if (!_isOpen) {
      _isOpen = true;

      // Opção 1: Remover o tesouro e adicionar um novo com sprite diferente
      removeFromParent();

      // Adicionar novo tesouro aberto na mesma posição
      gameRef.add(
        TesouroAbertoDecoration.withSprite(position: position, size: size),
      );
      if (userLevel.state.toInt() >= actualLevel.state) {
        setActualLevel();
        final insertResponse = await supabase.from('players').insert({
          'code': userCode.state,
          'name': userName.state,
          'level': actualLevel.state,
          'score': userScore.state,
        });

        TalkDialog.show(context, [
          Say(text: [TextSpan(text: "Você subiu de nível!")]),
        ], backgroundColor: Colors.transparent);
      }
      await Future.delayed(
        Duration(milliseconds: 500),
      ).then((v) => upgradeScore(50));
    }
  }
}

/// Nova classe para tesouro aberto
class TesouroAbertoDecoration extends GameDecoration with TapGesture {
  TesouroAbertoDecoration.withSprite({
    required super.position,
    required super.size,
  }) : super.withSprite(
         sprite: Sprite.load(
           "map/cave_ [resources].png",
           srcPosition: Vector2(80, 80), // Posição do sprite de tesouro aberto
           srcSize: Vector2(32, 32),
         ),
       );

  @override
  void onTap() {
    TalkDialog.show(
      context,
      [
        Say(text: [TextSpan(text: "Tesouro já foi aberto!")]),
      ],
      backgroundColor: Colors.transparent,
      dismissible: true,
    );
  }
}
