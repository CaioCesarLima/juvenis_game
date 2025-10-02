import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';

class BarlifeWidget extends StatelessWidget {
  const BarlifeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 20,
      color: Colors.brown,
      child: AtomBuilder(
        builder: (_, get) {
          final lifePercentage = userLife.state / 100.0;
          return Container(color: Colors.green, height: 20 * lifePercentage);
        },
      ),
    );
  }
}
