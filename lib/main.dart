import 'package:flutter/material.dart';
import 'package:juvenis_bonfire/game/fase01.dart';
import 'package:juvenis_bonfire/game/fase02.dart';
import 'package:juvenis_bonfire/game/fase03.dart';
import 'package:juvenis_bonfire/game/fase04.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:juvenis_bonfire/widgets/login_page.dart';
import 'package:juvenis_bonfire/widgets/ranking_page.dart';
import 'package:juvenis_bonfire/config/supabase_config.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print(100 ~/ 2);
  try {
    await SupabaseConfig.initialize();
  } catch (e) {
    print('Erro ao inicializar Supabase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    userLife.addListener(() {
      print("User Life: ${userLife.state}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A Batalha Final',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(), // Usa a LoginPage como tela inicial
      routes: {
        "/fase01": (context) => const Fase01(),
        "/fase02": (context) => const Fase02(),
        "/fase03": (context) => const Fase03(),
        "/fase04": (context) => const Fase04(),
        "/ranking": (context) => const RankingPage(),
      },
    );
  }
}
