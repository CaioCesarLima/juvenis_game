import 'package:bonfire/bonfire.dart';
import 'package:juvenis_bonfire/player/player_hero.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SpeedDecoration extends GameDecoration with Sensor<PlayerHero> {
  final supabase = Supabase.instance.client;
  SpeedDecoration.withSprite({required super.position, required super.size})
    : super.withSprite(
        sprite: Sprite.load(
          "map/cave_ [resources].png",
          srcPosition: Vector2(144, 16),
          srcSize: Vector2(16, 16),
        ),
      );

  @override
  Future<void> onContact(PlayerHero component) async {
    upgradeScore(20);

    removeFromParent();

    try {
      final existingRecord = await supabase
          .from('players')
          .select()
          .eq('code', userCode.state)
          .maybeSingle();

      if (existingRecord == null) {
        final insertResponse = await supabase.from('players').insert({
          'code': userCode.state,
          'name': userName.state,
          'level': actualLevel.state,
          'score': userScore.state,
        });
      } else {
        final response = await supabase
            .from('players')
            .update({'level': actualLevel.state, 'score': userScore.state})
            .eq('code', userCode.state);
      }

      final verifyResponse = await supabase
          .from('players')
          .select()
          .eq('code', userCode.state)
          .maybeSingle();

      if (verifyResponse != null) {}
    } catch (e) {
      print('SpeedDecoration: Error updating Supabase: $e');
    }

    super.onContact(component);
  }
}
