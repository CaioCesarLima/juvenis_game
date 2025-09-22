import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:juvenis_bonfire/enemy/enemy_chef_spritesheet.dart';
import 'package:juvenis_bonfire/store/chef/chef_atoms.dart';
import 'package:juvenis_bonfire/store/chef/question_model.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';

class EnemyChef extends SimpleEnemy with UseLifeBar, Lighting, TapGesture {
  late VoidCallback _chefListener;
  bool quizStarted = false;
  int talk = 0;
  final String name;
  EnemyChef({required super.position, required super.size, required this.name})
    : super(
        animation: EnemyChefSpritesheet.simpleDirectionAnimation,
        speed: 40,
        life: chefLife.state.toDouble(),
      ) {
    setupLifeBar(
      size: Vector2(40, 8),
      backgroundColor: Colors.red,
      borderColor: Colors.black,
      showLifeText: false,
      borderRadius: BorderRadius.circular(5),
      offset: Vector2(0, 10),
    );
    setupLighting(
      LightingConfig(radius: 32, color: Colors.white.withAlpha(10)),
    );
  }

  @override
  void update(double dt) {
    seePlayer(
      radiusVision: 48,
      visionAngle: 10,
      notObserved: () {
        talk = 0;
      },
      observed: (player) {},
    );
    super.update(dt);
  }

  void showTalkDialog(QuestionModel question) {
    showDialog(
      context: gameRef.context,
      builder: (context) {
        return AlertDialog(
          title: Text("Escolha a resposta:"),

          content: SingleChildScrollView(
            child: Column(
              children: [
                ...question.options.map((q) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (q.isCorrect) {
                          correctUp();
                          nextQuestion();
                          upgradeScore(100);
                          if (chefLife.state <= 0) {
                            _say("Você venceu dessa vez!");
                          } else {
                            _say(
                              "Correto, mas não vou desistir tão facilmente!",
                            );
                          }
                        } else {
                          demage();
                          _say("Errado!");
                        }
                      },
                      child: Text(q.text),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _say(String text) {
    TalkDialog.show(gameRef.context, [
      Say(
        text: [TextSpan(text: text)],
        person: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset('assets/images/enemy/chef.png'),
        ),
      ),
    ]);
  }

  @override
  double get life => chefLife.state.toDouble();

  @override
  Future<void> onLoad() {
    chefLife.addListener(() {
      addLife(life);
    });

    _chefListener = () {
      // Lógica para o ataque
      animation!.playOnce(
        SpriteAnimation.load(
          "enemy/chef_hit.png",
          SpriteAnimationData.sequenced(
            amount: 5,
            stepTime: 0.10,
            textureSize: Vector2(50, 50),
          ),
        ),
      );
      receiveDamage();

      Future.delayed(Duration(milliseconds: 800), () {
        if (chefLife.state <= 0) {
          removeFromParent();
        }
      });
    };

    correctAnswers.addListener(() {
      _chefListener();
    });

    add(
      RectangleHitbox(
        size: Vector2(80, 80),
        position: Vector2(11, 12),
        isSolid: true,
      ),
    );
    return super.onLoad();
  }

  @override
  void onTap() {
    if (talk == 0) {
      gameRef.player!.stopMove();
      gameRef.pauseEngine();
      if (question.state >= 0) {
        QuestionModel actualQuestion = questions.state[question.state];
        TalkDialog.show(
          context,
          [
            Say(
              text: [TextSpan(text: actualQuestion.text)],
              person: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/enemy/chef.png"),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          dismissible: true,
          onClose: () {
            Future.delayed(Duration.zero, () {
              showTalkDialog(actualQuestion);
            });
            gameRef.resumeEngine();
            talk++;
          },
        );
      } else {
        TalkDialog.show(
          context,
          [
            Say(
              text: [
                TextSpan(text: "Veremos se será capaz de passar por mim!!"),
              ],
              person: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/images/enemy/chef.png"),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          dismissible: true,
          onClose: () {
            nextQuestion();
            gameRef.resumeEngine();
            talk++;
          },
        );
      }
    }
  }
}
