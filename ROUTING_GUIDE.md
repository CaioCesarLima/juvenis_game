# Guia de Roteamento Baseado em Enum

Este projeto implementa um sistema de roteamento baseado no enum `UserLevels` usando o pacote `asp` para gerenciamento de estado.

## ✅ Status: FUNCIONANDO PERFEITAMENTE

O sistema está **totalmente funcional** e navega dinamicamente entre as fases. A solução final usa navegação direta nos botões para garantir compatibilidade com o `BonfireWidget`.

## Estrutura do Sistema

### 1. Enum UserLevels
```dart
enum UserLevels { fase_01, fase_02 }
```

### 2. Extensão LevelParsing
```dart
extension LevelParsing on UserLevels {
  int toInt() {
    switch (this) {
      case UserLevels.fase_01:
        return 1;
      case UserLevels.fase_02:
        return 2;
    }
  }

  String toRoute() {
    switch (this) {
      case UserLevels.fase_01:
        return "/fase01";
      case UserLevels.fase_02:
        return "/fase02";
    }
  }
}
```

### 3. Atom userLevel
```dart
final userLevel = atom<UserLevels>(UserLevels.fase_01);
```

## Como Funciona

### Solução Final: Navegação Direta
O sistema usa uma abordagem híbrida que combina:

1. **Actions do ASP** - Para atualizar o estado (`userLevel`)
2. **Navegação direta** - `Navigator.pushReplacementNamed()` nos botões
3. **Estado reativo** - `AtomBuilder` para mostrar o nível atual

### Actions para Navegação

#### Ir para um nível específico:
```dart
// Ir para Fase 01
goToFase01();

// Ir para Fase 02
goToFase02();
```

#### Avançar para o próximo nível:
```dart
upgradeLevel();
```

## Como Usar

### 1. Para navegar programaticamente:
```dart
// Em qualquer lugar do código
goToFase01(); // Atualiza o estado para Fase 01
goToFase02(); // Atualiza o estado para Fase 02
upgradeLevel(); // Avança para o próximo nível
```

### 2. Para navegar com interface:
```dart
// Nos botões das fases
ElevatedButton(
  onPressed: () {
    goToFase02(); // Atualiza o estado
    Navigator.of(context).pushReplacementNamed("/fase02"); // Navega
  },
  child: const Text('Ir para Fase 02'),
)
```

### 3. Para verificar o nível atual:
```dart
AtomBuilder(
  builder: (_, get) {
    return Text('Nível atual: ${userLevel.state.name}');
  },
)
```

### 4. Para obter a rota como string:
```dart
String currentRoute = userLevel.state.toRoute();
// Retorna "/fase01" ou "/fase02"
```

## Arquivos Principais

- **`lib/main.dart`** - Configuração do MaterialApp
- **`lib/store/user/user_actions.dart`** - Actions para navegação
- **`lib/store/user/user_atoms.dart`** - Atoms e enum
- **`lib/game/fase01.dart`** - Fase 01 com botões de navegação
- **`lib/game/fase02.dart`** - Fase 02 com botões de navegação

## Implementação dos Botões

### Fase 01
```dart
ElevatedButton(
  onPressed: () {
    goToFase02();
    Navigator.of(context).pushReplacementNamed("/fase02");
  },
  child: const Text('Ir para Fase 02'),
),
ElevatedButton(
  onPressed: () {
    upgradeLevel();
    if (userLevel.state == UserLevels.fase_02) {
      Navigator.of(context).pushReplacementNamed("/fase02");
    }
  },
  child: const Text('Próximo Nível'),
),
```

### Fase 02
```dart
ElevatedButton(
  onPressed: () {
    goToFase01();
    Navigator.of(context).pushReplacementNamed("/fase01");
  },
  child: const Text('Voltar para Fase 01'),
),
ElevatedButton(
  onPressed: () {
    upgradeLevel();
    // Não há próximo nível ainda
  },
  child: const Text('Próximo Nível'),
),
```

## Adicionando Novos Níveis

Para adicionar um novo nível:

1. Adicione ao enum:
```dart
enum UserLevels { fase_01, fase_02, fase_03 }
```

2. Atualize a extensão LevelParsing:
```dart
extension LevelParsing on UserLevels {
  int toInt() {
    switch (this) {
      case UserLevels.fase_01:
        return 1;
      case UserLevels.fase_02:
        return 2;
      case UserLevels.fase_03:
        return 3;
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
    }
  }
}
```

3. Crie a action para o novo nível:
```dart
final goToFase03 = atomAction((set) {
  set(userLevel, UserLevels.fase_03);
});
```

4. Atualize a action upgradeLevel:
```dart
final upgradeLevel = atomAction((set) {
  final currentLevel = userLevel.state;
  switch (currentLevel) {
    case UserLevels.fase_01:
      set(userLevel, UserLevels.fase_02);
      break;
    case UserLevels.fase_02:
      set(userLevel, UserLevels.fase_03);
      break;
    case UserLevels.fase_03:
      // Último nível ou voltar ao início
      break;
  }
});
```

5. Crie a nova fase:
```dart
class Fase03 extends StatefulWidget {
  const Fase03({super.key});

  @override
  State<Fase03> createState() => _Fase03State();
}

class _Fase03State extends State<Fase03> {
  late VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    reset();
    resetUser();
    _listener = () {};
    userLife.addListener(_listener);
  }

  @override
  void dispose() {
    userLife.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      // ... configuração do jogo
      overlayBuilderMap: {
        'navigation': (context, game) => const NavigationOverlay(),
      },
      initialActiveOverlays: ['navigation'],
    );
  }
}

class NavigationOverlay extends StatelessWidget {
  const NavigationOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: 20,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AtomBuilder(
              builder: (_, get) {
                return Text(
                  'Nível: ${userLevel.state.name}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                goToFase01();
                Navigator.of(context).pushReplacementNamed("/fase01");
              },
              child: const Text('Voltar para Fase 01'),
            ),
            ElevatedButton(
              onPressed: () {
                goToFase02();
                Navigator.of(context).pushReplacementNamed("/fase02");
              },
              child: const Text('Voltar para Fase 02'),
            ),
          ],
        ),
      ),
    );
  }
}
```

6. Adicione a rota no main.dart:
```dart
routes: {
  "/fase01": (context) => const Fase01(),
  "/fase02": (context) => const Fase02(),
  "/fase03": (context) => const Fase03(),
},
```

## Vantagens do Sistema

1. **Simples e confiável**: Navegação direta nos botões
2. **Type-safe**: Uso de enum garante valores válidos
3. **Estado reativo**: `AtomBuilder` mostra mudanças em tempo real
4. **Extensível**: Fácil de adicionar novos níveis
5. **Compatível com Bonfire**: Funciona perfeitamente com `BonfireWidget`
6. **Navegação dinâmica**: Não precisa de hot reload
7. **Performance**: Sem listeners complexos ou callbacks

## Teste do Sistema

O sistema foi testado e está funcionando perfeitamente:

- ✅ Navegação entre Fase 01 e Fase 02
- ✅ Botões de navegação nos overlays
- ✅ Actions programáticas
- ✅ Navegação dinâmica sem hot reload
- ✅ Compatibilidade total com BonfireWidget
- ✅ Estado reativo funcionando
- ✅ Interface responsiva

## Resumo da Solução

A solução final usa uma abordagem híbrida:
- **Estado**: Gerenciado pelo `asp` com `userLevel`
- **Navegação**: Direta com `Navigator.pushReplacementNamed()`
- **Interface**: Reativa com `AtomBuilder`

Esta abordagem garante máxima compatibilidade e confiabilidade! 🚀 