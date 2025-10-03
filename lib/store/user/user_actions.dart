// Action creation
import 'package:asp/asp.dart';
import 'package:juvenis_bonfire/store/chef/chef_atoms.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';

final upgradeLevel = atomAction((set) {
  switch (userLevel.state) {
    case UserLevels.fase_01:
      set(userLevel, UserLevels.fase_02);
      break;
    case UserLevels.fase_02:
      set(userLevel, UserLevels.fase_03);
      break;
    case UserLevels.fase_03:
      set(userLevel, UserLevels.fase_04);
      break;
    case UserLevels.fase_04:
      set(userLevel, UserLevels.fase_05);
      break;
    case UserLevels.fase_05:
      set(userLevel, UserLevels.fase_06);
      break;
    case UserLevels.fase_06:
      set(userLevel, UserLevels.fase_07);
      break;
    case UserLevels.fase_07:
      set(userLevel, UserLevels.fase_08);
      break;
    case UserLevels.fase_08:
      set(userLevel, UserLevels.fase_09);
      break;
    case UserLevels.fase_09:
      set(userLevel, UserLevels.fase_10);
      break;
    case UserLevels.fase_10:
      break;
  }
  print("oi ${userLevel.state.name()}");
});

final setName = atomAction1((set, String name) {
  set(userName, name);
});
final setScore = atomAction1((set, int score) {
  set(userScore, score);
});
final setLevel = atomAction1((set, int level) {
  set(actualLevel, level);
  // Converte o level int para o enum correspondente
  reset();
  switch (level) {
    case 1:
      set(userLevel, UserLevels.fase_01);
      break;
    case 2:
      set(userLevel, UserLevels.fase_02);
      break;
    case 3:
      set(userLevel, UserLevels.fase_03);
      break;
    case 4:
      set(userLevel, UserLevels.fase_04);
      break;
    case 5:
      set(userLevel, UserLevels.fase_05);
      break;
    case 6:
      set(userLevel, UserLevels.fase_06);
      break;
    case 7:
      set(userLevel, UserLevels.fase_07);
      break;
    case 8:
      set(userLevel, UserLevels.fase_08);
      break;
    case 9:
      set(userLevel, UserLevels.fase_09);
      break;
    case 10:
      set(userLevel, UserLevels.fase_10);
      break;
    default:
      set(userLevel, UserLevels.fase_01);
  }
});

final setActualLevel = atomAction((set) {
  set(actualLevel, actualLevel.state + 1);
});

final setSpeed = atomAction1((set, int speed) {
  set(userSpeed, speed);
});

final setLight = atomAction1((set, int light) {
  set(userLight, light);
});

final setCode = atomAction1((set, String code) {
  set(userCode, code);
});

// Action para finalizar o carregamento
final finishLoading = atomAction((set) {
  set(isLoading, false);
});

final decreaseLevel = atomAction((set) {
  final currentLevel = userLevel.state;
  print(currentLevel);
  switch (currentLevel) {
    case UserLevels.fase_01:
      break;
    case UserLevels.fase_02:
      set(userLevel, UserLevels.fase_01);
      break;
    case UserLevels.fase_03:
      set(userLevel, UserLevels.fase_02);
      break;
    case UserLevels.fase_04:
      set(userLevel, UserLevels.fase_03);
      break;
    case UserLevels.fase_05:
      set(userLevel, UserLevels.fase_04);
      break;
    case UserLevels.fase_06:
      set(userLevel, UserLevels.fase_05);
      break;
    case UserLevels.fase_07:
      set(userLevel, UserLevels.fase_06);
      break;
    case UserLevels.fase_08:
      set(userLevel, UserLevels.fase_07);
      break;
    case UserLevels.fase_09:
      set(userLevel, UserLevels.fase_08);
      break;
    case UserLevels.fase_10:
      set(userLevel, UserLevels.fase_09);
      break;
  }
});

final upgradeLight = atomAction((set) {
  set(userLight, userLight.state + 1);
});

final upgradeScore = atomAction1((set, int score) {
  set(userScore, userScore.state + score);
});

final demage = atomAction((set) {
  int demageTotal = 0;
  if (userLevel.state.toInt() <= 3) {
    demageTotal = 20;
  } else if (userLevel.state.toInt() <= 6) {
    demageTotal = 25;
  } else if (userLevel.state.toInt() <= 9) {
    demageTotal = 34;
  } else if (userLevel.state.toInt() <= 10) {
    demageTotal = 50;
  } else if (userLevel.state.toInt() == 12) {
    demageTotal = 100;
  }
  final newLife = userLife.state - demageTotal;
  print("newLife: $newLife");
  set(userLife, newLife < 0 ? 0 : newLife);
});

final lifeUp = atomAction((set) {
  final newLife = userLife.state + 10;
  print("newLife: $newLife");
  set(userLife, newLife > 100 ? 100 : newLife);
});

final resetUser = atomAction((set) {
  set(userLife, 100);
});

final goToFase01 = atomAction((set) {
  set(userLevel, UserLevels.fase_01);
});

final goToFase02 = atomAction((set) {
  set(userLevel, UserLevels.fase_02);
});

final goToFase03 = atomAction((set) {
  set(userLevel, UserLevels.fase_03);
});

final goToFase04 = atomAction((set) {
  set(userLevel, UserLevels.fase_04);
});

final goToFase05 = atomAction((set) {
  set(userLevel, UserLevels.fase_05);
});

final goToFase06 = atomAction((set) {
  set(userLevel, UserLevels.fase_06);
});

final goToFase07 = atomAction((set) {
  set(userLevel, UserLevels.fase_07);
});

final goToFase08 = atomAction((set) {
  set(userLevel, UserLevels.fase_08);
});

final goToFase09 = atomAction((set) {
  set(userLevel, UserLevels.fase_09);
});

final goToFase10 = atomAction((set) {
  set(userLevel, UserLevels.fase_10);
});
