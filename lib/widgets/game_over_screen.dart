import 'package:flutter/material.dart';
import 'package:asp/asp.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';

class GameOverScreen extends StatefulWidget {
  final VoidCallback? onRestart;

  const GameOverScreen({super.key, this.onRestart});

  @override
  State<GameOverScreen> createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleRestart() {
    // Resetar dados do jogador
    resetUser();

    // Navegar para a fase 01
    goToFase01();

    // Fechar o dialog
    Navigator.of(context).pop();

    // Chamar callback se fornecido
    if (widget.onRestart != null) {
      widget.onRestart!();
    }
  }

  void _handleBackToLogin() {
    // Resetar dados do jogador
    resetUser();

    // Fechar o dialog
    Navigator.of(context).pop();

    // Navegar de volta para a tela de login
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1a1a2e),
                  Color(0xFF16213e),
                  Color(0xFF0f3460),
                ],
              ),
            ),
            child: Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _slideAnimation.value),
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Ícone de game over
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.redAccent,
                                    width: 3,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.warning_rounded,
                                  size: 38,
                                  color: Colors.redAccent,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Título Game Over
                              const Text(
                                'GAME OVER',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4.0,
                                  shadows: [
                                    Shadow(
                                      color: Colors.red,
                                      offset: Offset(0, 0),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                              ),

                              // Subtítulo
                              const Text(
                                'Sua jornada chegou ao fim',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Botão Jogar Novamente
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Resetar dados do jogador primeiro
                                    resetUser();

                                    // Fechar o dialog primeiro
                                    Navigator.of(context).pop();

                                    // Chamar callback se fornecido (para despausar a engine)
                                    if (widget.onRestart != null) {
                                      widget.onRestart!();
                                    }

                                    // Navegar para a fase 01 (criará uma nova instância)
                                    Navigator.of(
                                      context,
                                    ).pushReplacementNamed("/fase01");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purpleAccent,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 8,
                                    shadowColor: Colors.purpleAccent
                                        .withOpacity(0.5),
                                  ),
                                  child: const Text(
                                    'JOGAR NOVAMENTE',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Botão pequeno para sair e fazer novo login
          Positioned(
            top: 32,
            right: 32,
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.white70, size: 28),
              tooltip: 'Sair e fazer novo login',
              onPressed: () {
                resetUser();
                Navigator.of(context).pop();
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
