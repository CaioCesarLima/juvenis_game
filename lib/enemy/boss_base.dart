import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:juvenis_bonfire/store/chef/chef_atoms.dart';
import 'package:juvenis_bonfire/store/chef/question_model.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';
import 'package:logger/web.dart';

abstract class BossBase extends SimpleEnemy
    with UseLifeBar, Lighting, TapGesture {
  late VoidCallback _bossListener;
  bool quizStarted = false;
  int talk = 0;
  final String name;
  final String spritePath;
  final String facePath;
  final int phaseNumber;
  final SimpleDirectionAnimation spriteAnimationCustom;
  final RectangleHitbox hitbox;

  BossBase({
    required this.spriteAnimationCustom,
    required super.position,
    required super.size,
    required this.name,
    required this.spritePath,
    required this.phaseNumber,
    required this.facePath,
    required this.hitbox,
  }) : super(
         animation: spriteAnimationCustom,
         speed: 40,
         life: chefLife.state.toDouble(),
       ) {
    setupLifeBar(
      size: Vector2(40, 4),
      backgroundColor: Colors.red,
      borderColor: Colors.black,
      showLifeText: false,
      borderRadius: BorderRadius.circular(5),
      offset: Vector2(0, 5),
    );
    setupLighting(
      LightingConfig(radius: 32, color: Colors.white.withAlpha(10)),
    );
  }

  @override
  void onDie() {
    setPlayerAwayFromChef();
    super.onDie();
  }

  @override
  void update(double dt) {
    seePlayer(
      radiusVision: 64,
      visionAngle: 20,
      notObserved: () {
        talk = 0;
        setPlayerAwayFromChef();
      },
      observed: (player) {
        setPlayerNearChef();
      },
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
                          receiveDamage();
                          if (chefLife.state <= 0) {
                            _say(getVictoryMessage());
                          } else {
                            _say(getCorrectAnswerMessage());
                          }
                        } else {
                          demage();
                          _say(getWrongAnswerMessage());
                        }
                      },
                      child: Text(q.text),
                    ),
                  );
                }),
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
          child: Image.asset('assets/images/$facePath'),
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

    _bossListener = () {
      // Lógica para o ataque
      animation!.playOnce(getHitAnimation());

      Future.delayed(Duration(milliseconds: 800), () {
        if (chefLife.state <= 0) {
          removeFromParent();
        }
      });
    };

    // Listener para quando o boss recebe dano (resposta correta)
    correctAnswers.addListener(() {
      _bossListener();
    });

    add(hitbox);
    return super.onLoad();
  }

  @override
  void onTap() {
    if (talk == 0) {
      gameRef.player!.stopMove();
      gameRef.pauseEngine();
      if (question.state >= 0) {
        if (question.state < questions.state.length) {
          Logger().d(question.state);
          Logger().d(questions.state.length);
          QuestionModel actualQuestion = questions.state[question.state];
          TalkDialog.show(
            context,
            [
              Say(
                text: [TextSpan(text: actualQuestion.text)],
                person: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/$facePath'),
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
                text: [TextSpan(text: "Já respondeu todas!")],
                person: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/$facePath'),
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            dismissible: true,
            onClose: () {
              gameRef.resumeEngine();
              talk++;
            },
          );
        }
      } else {
        TalkDialog.show(
          context,
          [
            Say(
              text: [TextSpan(text: getInitialMessage())],
              person: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/$facePath'),
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

  // Métodos abstratos para personalizar por boss
  String getBossName() => name;
  String getVictoryMessage() => "Você venceu dessa vez!";
  String getCorrectAnswerMessage() =>
      "Correto, mas não vou desistir tão facilmente!";
  String getWrongAnswerMessage() => "Errado!";
  String getInitialMessage() => "Veremos se será capaz de passar por mim!!";

  // Método abstrato para retornar a animação de hit específica do boss
  Future<SpriteAnimation> getHitAnimation();
}
