import 'package:asp/asp.dart';

final userLife = atom<int>(100);
final userScore = atom<int>(0);
final userLight = atom<int>(1);
final userLevel = atom<UserLevels>(UserLevels.fase_01);
final userName = atom<String>("Caio");
final actualLevel = atom<int>(2);
final isLoading = atom<bool>(true);
final userCode = atom<String>("");

enum UserLevels { fase_01, fase_02, fase_03, fase_04 }

extension LevelParsing on UserLevels {
  int toInt() {
    switch (this) {
      case UserLevels.fase_01:
        return 1;
      case UserLevels.fase_02:
        return 2;
      case UserLevels.fase_03:
        return 3;
      case UserLevels.fase_04:
        return 4;
    }
  }

  String toRoute() {
    switch (this) {
      case UserLevels.fase_01:
        return "/fase01";
      case UserLevels.fase_02:
        return "/fase02";
      case UserLevels.fase_03:
        return "/fase03";
      case UserLevels.fase_04:
        return "/fase04";
    }
  }

  String name() {
    switch (this) {
      case UserLevels.fase_01:
        return "Fase 01";
      case UserLevels.fase_02:
        return "Fase 02";
      case UserLevels.fase_03:
        return "Fase 03";
      case UserLevels.fase_04:
        return "Fase 04";
    }
  }
}
