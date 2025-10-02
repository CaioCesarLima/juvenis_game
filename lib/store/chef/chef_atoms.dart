import 'package:asp/asp.dart';
import 'package:juvenis_bonfire/store/chef/option_model.dart';
import 'package:juvenis_bonfire/store/chef/question_model.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:logger/logger.dart';

final question = atom<int>(-1);
final correctAnswers = atom<int>(0);
final chefLife = atom<int>(questions.state.length * 10);
final isPlayerNearChef = atom<bool>(false);

final questions = atom<List<QuestionModel>>(
  getQuestions[userLevel.state.toInt()]!,
);

final nextQuestion = atomAction((set) {
  set(question, question.state + 1);
});
final correctUp = atomAction((set) {
  set(correctAnswers, correctAnswers.state + 1);
});

final receiveDamage = atomAction((set) {
  Logger().w("recebeu ataque");
  set(chefLife, chefLife.state - 10);
});
final reset = atomAction((set) {
  set(question, -1);
  set(correctAnswers, 0);
  set(questions, getQuestions[userLevel.state.toInt()] ?? getQuestions[1]!);
  set(chefLife, questions.state.length * 10);
  Logger().d(chefLife.state);
  set(isPlayerNearChef, false);
});

final setPlayerNearChef = atomAction((set) {
  print("está perto");
  set(isPlayerNearChef, true);
});

final setPlayerAwayFromChef = atomAction((set) {
  print("está longe");
  set(isPlayerNearChef, false);
});

final setChefLife = atomAction((set) {
  set(chefLife, questions.state.length * 10);
});

Map<int, List<QuestionModel>> getQuestions = {
  1: [
    QuestionModel(
      text: "Quem construiu a arca para escapar do dilúvio?",
      options: [
        OptionModel(text: "Noé", isCorrect: true),
        OptionModel(text: "Moisés", isCorrect: false),
        OptionModel(text: "Abraão", isCorrect: false),
        OptionModel(text: "Davi", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Quem foi engolido por um grande peixe?",
      options: [
        OptionModel(text: "Jonas", isCorrect: true),
        OptionModel(text: "Pedro", isCorrect: false),
        OptionModel(text: "Elias", isCorrect: false),
        OptionModel(text: "Daniel", isCorrect: false),
      ],
    ),
  ],
  2: [
    QuestionModel(
      text: "Qual era o nome da esposa de Adão?",
      options: [
        OptionModel(text: "Eva", isCorrect: true),
        OptionModel(text: "Sara", isCorrect: false),
        OptionModel(text: "Rebeca", isCorrect: false),
        OptionModel(text: "Marta", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual o nome do jardim onde Adão e Eva viviam?",
      options: [
        OptionModel(text: "Éden", isCorrect: true),
        OptionModel(text: "Getsêmani", isCorrect: false),
        OptionModel(text: "Canaã", isCorrect: false),
        OptionModel(text: "Babel", isCorrect: false),
      ],
    ),
  ],
  3: [
    QuestionModel(
      text: "Quantos dias e noites choveu no dilúvio?",
      options: [
        OptionModel(text: "40", isCorrect: true),
        OptionModel(text: "30", isCorrect: false),
        OptionModel(text: "7", isCorrect: false),
        OptionModel(text: "21", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Quem matou Golias com uma funda e uma pedra?",
      options: [
        OptionModel(text: "Davi", isCorrect: true),
        OptionModel(text: "Sansão", isCorrect: false),
        OptionModel(text: "José", isCorrect: false),
        OptionModel(text: "Saul", isCorrect: false),
      ],
    ),
  ],
  4: [
    QuestionModel(
      text: "Quem foi lançado na cova dos leões?",
      options: [
        OptionModel(text: "Daniel", isCorrect: true),
        OptionModel(text: "José", isCorrect: false),
        OptionModel(text: "Elias", isCorrect: false),
        OptionModel(text: "Pedro", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Quem foi lançado na cova dos leões?",
      options: [
        OptionModel(text: "Daniel", isCorrect: true),
        OptionModel(text: "Elias", isCorrect: false),
        OptionModel(text: "Moisés", isCorrect: false),
        OptionModel(text: "Josué", isCorrect: false),
      ],
    ),

    QuestionModel(
      text: "Quantos dias Deus levou para criar o mundo?",
      options: [
        OptionModel(text: "Seis dias", isCorrect: true),
        OptionModel(text: "Sete dias", isCorrect: false),
        OptionModel(text: "Cinco dias", isCorrect: false),
        OptionModel(text: "Quarenta dias", isCorrect: false),
      ],
    ),
  ],
};
