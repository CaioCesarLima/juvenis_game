import 'package:asp/asp.dart';
import 'package:juvenis_bonfire/store/chef/option_model.dart';
import 'package:juvenis_bonfire/store/chef/question_model.dart';

final question = atom<int>(-1);
final correctAnswers = atom<int>(0);
final chefLife = atom<int>(questions.state.length * 10);

final questions = atom<List<QuestionModel>>(getQuestions);

final nextQuestion = atomAction((set) {
  set(question, question.state + 1);
});
final correctUp = atomAction((set) {
  set(correctAnswers, correctAnswers.state + 1);
});

final receiveDamage = atomAction((set) {
  set(chefLife, chefLife.state - 10);
});
final reset = atomAction((set) {
  set(question, -1);
  set(correctAnswers, 0);
  set(chefLife, questions.state.length * 10);
});

List<QuestionModel> getQuestions = [
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
    text: "Qual era o nome da esposa de Adão?",
    options: [
      OptionModel(text: "Eva", isCorrect: true),
      OptionModel(text: "Sara", isCorrect: false),
      OptionModel(text: "Rebeca", isCorrect: false),
      OptionModel(text: "Marta", isCorrect: false),
    ],
  ),

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
    text: "Quem foi lançado na cova dos leões?",
    options: [
      OptionModel(text: "Daniel", isCorrect: true),
      OptionModel(text: "José", isCorrect: false),
      OptionModel(text: "Elias", isCorrect: false),
      OptionModel(text: "Pedro", isCorrect: false),
    ],
  ),
];
