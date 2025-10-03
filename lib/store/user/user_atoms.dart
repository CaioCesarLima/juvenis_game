import 'package:asp/asp.dart';

final userLife = atom<int>(100);
final userScore = atom<int>(0);
final userLight = atom<int>(1);
final userLevel = atom<UserLevels>(UserLevels.fase_01);
final userName = atom<String>("Caio");
final actualLevel = atom<int>(2);
final userSpeed = atom<int>(20);
final isLoading = atom<bool>(true);
final userCode = atom<String>("");

enum UserLevels {
  fase_01,
  fase_02,
  fase_03,
  fase_04,
  fase_05,
  fase_06,
  fase_07,
  fase_08,
  fase_09,
  fase_10,
}

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
      case UserLevels.fase_05:
        return 5;
      case UserLevels.fase_06:
        return 6;
      case UserLevels.fase_07:
        return 7;
      case UserLevels.fase_08:
        return 8;
      case UserLevels.fase_09:
        return 9;
      case UserLevels.fase_10:
        return 10;
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
      case UserLevels.fase_05:
        return "/fase05";
      case UserLevels.fase_06:
        return "/fase06";
      case UserLevels.fase_07:
        return "/fase07";
      case UserLevels.fase_08:
        return "/fase08";
      case UserLevels.fase_09:
        return "/fase09";
      case UserLevels.fase_10:
        return "/fase10";
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
      case UserLevels.fase_05:
        return "Fase 05";
      case UserLevels.fase_06:
        return "Fase 06";
      case UserLevels.fase_07:
        return "Fase 07";
      case UserLevels.fase_08:
        return "Fase 08";
      case UserLevels.fase_09:
        return "Fase 09";
      case UserLevels.fase_10:
        return "Fase 10";
    }
  }
}
