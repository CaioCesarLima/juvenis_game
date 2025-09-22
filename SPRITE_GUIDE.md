# Guia de Sprites e Tilesets no Bonfire

Este guia explica como trabalhar com sprites, tilesets e como trocar sprites dinamicamente no Bonfire.

## 📋 Informações do Tileset

### Cave Tileset
- **Arquivo**: `assets/images/map/cave_ [resources].png`
- **Colunas**: 22
- **Tiles**: 16x16 pixels
- **Largura total**: 352 pixels
- **Altura total**: 192 pixels

### Cálculo de Posições

Para encontrar a posição de um tile específico:
```dart
// Tile ID para posição
int tileId = 48;
int coluna = tileId % 22; // 48 % 22 = 4
int linha = tileId ~/ 22; // 48 ~/ 22 = 2
Vector2 posicao = Vector2(coluna * 16, linha * 16); // Vector2(64, 32)
```

## 🎨 Como Pegar Múltiplos Tiles

### 1. Sprite de 1x1 tile (16x16 pixels)
```dart
Sprite.load(
  "map/cave_ [resources].png",
  srcPosition: Vector2(48, 80),
  srcSize: Vector2(16, 16),
)
```

### 2. Sprite de 2x2 tiles (32x32 pixels)
```dart
Sprite.load(
  "map/cave_ [resources].png",
  srcPosition: Vector2(48, 80),
  srcSize: Vector2(32, 32), // 2 * 16 = 32
)
```

### 3. Sprite de 3x3 tiles (48x48 pixels)
```dart
Sprite.load(
  "map/cave_ [resources].png",
  srcPosition: Vector2(48, 80),
  srcSize: Vector2(48, 48), // 3 * 16 = 48
)
```

### 4. Sprite horizontal de 4x1 tiles (64x16 pixels)
```dart
Sprite.load(
  "map/cave_ [resources].png",
  srcPosition: Vector2(48, 80),
  srcSize: Vector2(64, 16), // 4 * 16 = 64, 1 * 16 = 16
)
```

### 5. Sprite vertical de 1x4 tiles (16x64 pixels)
```dart
Sprite.load(
  "map/cave_ [resources].png",
  srcPosition: Vector2(48, 80),
  srcSize: Vector2(16, 64), // 1 * 16 = 16, 4 * 16 = 64
)
```

## 🔄 Como Trocar Sprites

### Opção 1: Substituir Objeto (Recomendado)

```dart
class TesouroDecoration extends GameDecoration with TapGesture {
  bool _isOpen = false;

  TesouroDecoration.withSprite({required super.position, required super.size})
    : super.withSprite(
        sprite: Sprite.load(
          "map/cave_ [resources].png",
          srcPosition: Vector2(48, 80), // Tesouro fechado
          srcSize: Vector2(32, 32),
        ),
      );

  @override
  void onTap() {
    if (!_isOpen) {
      _openTreasure();
    }
  }

  void _openTreasure() {
    _isOpen = true;
    
    // Remove o tesouro fechado
    removeFromParent();
    
    // Adiciona o tesouro aberto na mesma posição
    gameRef.add(
      TesouroAbertoDecoration.withSprite(
        position: position,
        size: size,
      ),
    );
  }
}

class TesouroAbertoDecoration extends GameDecoration with TapGesture {
  TesouroAbertoDecoration.withSprite({required super.position, required super.size})
    : super.withSprite(
        sprite: Sprite.load(
          "map/cave_ [resources].png",
          srcPosition: Vector2(80, 80), // Tesouro aberto
          srcSize: Vector2(32, 32),
        ),
      );

  @override
  void onTap() {
    // Comportamento do tesouro aberto
  }
}
```

### Opção 2: Usar Animação

```dart
class TesouroDecoration extends GameDecoration with TapGesture {
  TesouroDecoration.withSprite({required super.position, required super.size})
    : super.withSprite(
        sprite: Sprite.load(
          "map/cave_ [resources].png",
          srcPosition: Vector2(48, 80),
          srcSize: Vector2(32, 32),
        ),
      );

  void _addOpenAnimation() {
    // Criar animação de abertura
    final openAnimation = SpriteAnimation.load(
      "map/cave_ [resources].png",
      SpriteAnimationData.sequenced(
        amount: 4, // Número de frames
        stepTime: 0.1, // Tempo entre frames
        textureSize: Vector2(32, 32), // Tamanho de cada frame
        texturePosition: Vector2(80, 80), // Posição inicial
      ),
    );
    
    // Aplicar a animação (se o método existir)
    // changeSprite(openAnimation);
  }
}
```

### Opção 3: Usar Variável de Estado

```dart
class TesouroDecoration extends GameDecoration with TapGesture {
  bool _isOpen = false;

  TesouroDecoration.withSprite({required super.position, required super.size})
    : super.withSprite(
        sprite: Sprite.load(
          "map/cave_ [resources].png",
          srcPosition: Vector2(48, 80),
          srcSize: Vector2(32, 32),
        ),
      );

  @override
  void onTap() {
    if (!_isOpen && chefLife.state <= 0) {
      _isOpen = true;
      // Lógica para abrir o tesouro
    }
  }

  @override
  Widget build(BuildContext context) {
    // Renderizar sprite baseado no estado
    return _isOpen 
      ? _buildOpenSprite()
      : _buildClosedSprite();
  }

  Widget _buildOpenSprite() {
    return SpriteWidget(
      sprite: Sprite.load(
        "map/cave_ [resources].png",
        srcPosition: Vector2(80, 80),
        srcSize: Vector2(32, 32),
      ),
    );
  }

  Widget _buildClosedSprite() {
    return SpriteWidget(
      sprite: Sprite.load(
        "map/cave_ [resources].png",
        srcPosition: Vector2(48, 80),
        srcSize: Vector2(32, 32),
      ),
    );
  }
}
```

## 🎯 Exemplos Práticos

### Exemplo 1: Porta que Abre/Fecha

```dart
class PortaDecoration extends GameDecoration with TapGesture {
  bool _isOpen = false;

  PortaDecoration.withSprite({required super.position, required super.size})
    : super.withSprite(
        sprite: Sprite.load(
          "map/cave_ [resources].png",
          srcPosition: Vector2(0, 0), // Porta fechada
          srcSize: Vector2(32, 48), // 2x3 tiles
        ),
      );

  @override
  void onTap() {
    _toggleDoor();
  }

  void _toggleDoor() {
    _isOpen = !_isOpen;
    
    removeFromParent();
    
    gameRef.add(
      _isOpen 
        ? PortaAbertaDecoration.withSprite(position: position, size: size)
        : PortaFechadaDecoration.withSprite(position: position, size: size),
    );
  }
}
```

### Exemplo 2: Item que Muda de Estado

```dart
class ItemDecoration extends GameDecoration with TapGesture {
  int _state = 0; // 0: normal, 1: ativo, 2: usado

  ItemDecoration.withSprite({required super.position, required super.size})
    : super.withSprite(
        sprite: Sprite.load(
          "map/cave_ [resources].png",
          srcPosition: Vector2(0, 0), // Estado normal
          srcSize: Vector2(16, 16),
        ),
      );

  @override
  void onTap() {
    _nextState();
  }

  void _nextState() {
    _state = (_state + 1) % 3;
    
    removeFromParent();
    
    switch (_state) {
      case 0:
        gameRef.add(ItemNormalDecoration.withSprite(position: position, size: size));
        break;
      case 1:
        gameRef.add(ItemAtivoDecoration.withSprite(position: position, size: size));
        break;
      case 2:
        gameRef.add(ItemUsadoDecoration.withSprite(position: position, size: size));
        break;
    }
  }
}
```

## 📐 Tabela de Tamanhos Comuns

| Tiles | Largura | Altura | srcSize |
|-------|---------|--------|---------|
| 1x1   | 16      | 16     | Vector2(16, 16) |
| 2x2   | 32      | 32     | Vector2(32, 32) |
| 3x3   | 48      | 48     | Vector2(48, 48) |
| 4x4   | 64      | 64     | Vector2(64, 64) |
| 6x6   | 96      | 96     | Vector2(96, 96) |
| 8x8   | 128     | 128    | Vector2(128, 128) |
| 4x1   | 64      | 16     | Vector2(64, 16) |
| 1x4   | 16      | 64     | Vector2(16, 64) |

## 🎮 Dicas Importantes

1. **Posições**: Sempre calcule baseado em múltiplos de 16 (tamanho do tile)
2. **Tamanhos**: Use `Vector2(largura_em_tiles * 16, altura_em_tiles * 16)`
3. **Troca de Sprites**: Use `removeFromParent()` + `gameRef.add()` para trocar objetos
4. **Performance**: Evite trocar sprites muito frequentemente
5. **Colisões**: Lembre-se de ajustar hitboxes quando trocar sprites

## 🔧 Ferramentas Úteis

### Calculadora de Posição
```dart
Vector2 calculateTilePosition(int tileId) {
  int coluna = tileId % 22;
  int linha = tileId ~/ 22;
  return Vector2(coluna * 16, linha * 16);
}
```

### Calculadora de Tamanho
```dart
Vector2 calculateTileSize(int widthTiles, int heightTiles) {
  return Vector2(widthTiles * 16, heightTiles * 16);
}
``` 