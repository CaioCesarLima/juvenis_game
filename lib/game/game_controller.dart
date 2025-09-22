import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:juvenis_bonfire/widgets/game_over_screen.dart';

class GameController extends GameComponent {
  bool showGameOver = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Resetar o estado quando o controller for carregado
    showGameOver = false;
  }

  @override
  void update(double dt) {
    if (checkInterval("gameOver", 100, dt)) {
      if (gameRef.player != null && gameRef.player?.isDead == true) {
        if (!showGameOver) {
          showGameOver = true;
          gameRef.pauseEngine();
          _showDialogGameOver();
        }
      }
    }
    super.update(dt);
  }

  void _showDialogGameOver() {
    showGameOver = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (context) {
        return GameOverScreen(
          onRestart: () {
            // Garantir que a engine seja despausada
            gameRef.resumeEngine();

            // Resetar o estado do game controller
            showGameOver = false;
          },
        );
      },
    );
  }
}
