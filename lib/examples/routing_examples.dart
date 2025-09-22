import 'package:flutter/material.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:juvenis_bonfire/store/user/user_actions.dart';
import 'package:asp/asp.dart';

/// Exemplos práticos de como usar o sistema de roteamento baseado em enum
class RoutingExamples {
  /// Exemplo 1: Navegação simples entre níveis
  static void navigateBetweenLevels() {
    // Ir para Fase 01
    goToFase01();

    // Ir para Fase 02
    goToFase02();

    // Avançar para o próximo nível
    upgradeLevel();
  }

  /// Exemplo 2: Verificar o nível atual
  static String getCurrentLevelName() {
    return userLevel.state.name(); // Retorna "fase_01" ou "fase_02"
  }

  /// Exemplo 3: Obter a rota como string
  static String getCurrentRoute() {
    return userLevel.state.toRoute(); // Retorna "/fase01" ou "/fase02"
  }

  /// Exemplo 4: Verificar se está em um nível específico
  static bool isInFase01() {
    return userLevel.state == UserLevels.fase_01;
  }

  static bool isInFase02() {
    return userLevel.state == UserLevels.fase_02;
  }

  /// Exemplo 5: Navegação condicional
  static void navigateConditionally() {
    if (isInFase01()) {
      goToFase02();
    } else if (isInFase02()) {
      goToFase01();
    }
  }

  /// Exemplo 6: Reset para o primeiro nível
  static void resetToFirstLevel() {
    goToFase01();
  }
}

/// Widget de exemplo que mostra como usar o sistema de roteamento
class RoutingExampleWidget extends StatelessWidget {
  const RoutingExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplos de Roteamento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exemplo 1: Mostrar nível atual
            AtomBuilder(
              builder: (_, get) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nível Atual: ${userLevel.state.name}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Rota: ${userLevel.state.toRoute()}'),
                        Text('Valor numérico: ${userLevel.state.toInt()}'),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Exemplo 2: Botões de navegação
            const Text(
              'Navegação Direta:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => goToFase01(),
                    child: const Text('Fase 01'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => goToFase02(),
                    child: const Text('Fase 02'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Exemplo 3: Navegação condicional
            const Text(
              'Navegação Condicional:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            AtomBuilder(
              builder: (_, get) {
                return ElevatedButton(
                  onPressed: () {
                    if (userLevel.state == UserLevels.fase_01) {
                      goToFase02();
                    } else {
                      goToFase01();
                    }
                  },
                  child: Text(
                    userLevel.state == UserLevels.fase_01
                        ? 'Ir para Fase 02'
                        : 'Voltar para Fase 01',
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Exemplo 4: Próximo nível
            const Text(
              'Avançar Nível:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => upgradeLevel(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('Próximo Nível'),
            ),

            const SizedBox(height: 16),

            // Exemplo 5: Informações do sistema
            const Text(
              'Informações do Sistema:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total de níveis: ${UserLevels.values.length}'),
                    Text(
                      'Níveis disponíveis: ${UserLevels.values.map((e) => e.name).join(', ')}',
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Como usar:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text('• goToFase01() - Ir para Fase 01'),
                    const Text('• goToFase02() - Ir para Fase 02'),
                    const Text('• upgradeLevel() - Avançar nível'),
                    const Text('• userLevel.state - Nível atual'),
                    const Text('• userLevel.state.toRoute() - Rota atual'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
