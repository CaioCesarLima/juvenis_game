# Tela de Game Over

## Visão Geral

A tela de game over foi redesenhada seguindo o mesmo estilo visual da tela de login, criando uma experiência consistente e moderna para o usuário quando o jogador perde a partida.

## Características Principais

### **Design Consistente**
- Mesmo gradiente escuro da tela de login
- Cores roxas e vermelhas para transmitir a sensação de "fim de jogo"
- Animações suaves de fade, scale e slide
- Tipografia com sombras e efeitos visuais

### **Elementos Visuais**
- **Ícone de Aviso**: Ícone de warning em vermelho dentro de um círculo
- **Título "GAME OVER"**: Texto grande em vermelho com sombra
- **Subtítulo**: "Sua jornada chegou ao fim"
- **Estatísticas**: Mostra nível, pontos e luz do jogador
- **Botões**: Dois botões principais com estilos diferentes

### **Funcionalidades**
- **Jogar Novamente**: Reseta os dados do jogador e volta para a Fase 01
- **Voltar ao Login**: Reseta os dados e retorna à tela de login
- **Estatísticas**: Exibe as estatísticas finais da partida
- **Animações**: Transições suaves ao aparecer

## Animações

### **Tipos de Animação**
1. **Fade Animation**: Aparece gradualmente (0.0 → 1.0)
2. **Scale Animation**: Cresce com efeito elástico (0.8 → 1.0)
3. **Slide Animation**: Desliza de baixo para cima (50px → 0px)

### **Duração**
- Todas as animações duram 2 segundos
- Curvas de animação suaves para uma experiência agradável

## Integração com o Sistema

### **Actions Utilizadas**
- `resetUser()`: Reseta vida, pontuação e outros dados
- `goToFase01()`: Define o nível para Fase 01
- `userLevel.state`: Obtém o nível atual do jogador
- `userScore.state`: Obtém a pontuação atual
- `userLight.state`: Obtém o nível de luz atual

### **Navegação**
- **Dialog**: Aparece como um dialog modal sobre o jogo
- **Fechamento**: Fecha automaticamente ao escolher uma opção
- **Redirecionamento**: Navega para a tela apropriada após fechar

## Estrutura do Código

### **Arquivos Principais**
- `lib/widgets/game_over_screen.dart` - Tela de game over principal
- `lib/game/game_controller.dart` - Controlador que chama a tela

### **Métodos Principais**
- `_handleRestart()`: Lida com o botão "Jogar Novamente"
- `_handleBackToLogin()`: Lida com o botão "Voltar ao Login"
- `_buildStatItem()`: Constrói os itens de estatística

## Estilo Visual

### **Cores**
- **Fundo**: Gradiente escuro (preto, azul escuro, roxo)
- **Título**: Vermelho accent com sombra vermelha
- **Botão Principal**: Roxo accent (mesmo da tela de login)
- **Botão Secundário**: Transparente com borda branca
- **Estatísticas**: Branco com labels em cinza claro

### **Layout**
- **Centralizado**: Todo o conteúdo centralizado na tela
- **Responsivo**: Adapta-se a diferentes tamanhos de tela
- **Espaçamento**: Padding e margins consistentes
- **Hierarquia**: Tamanhos de fonte bem definidos

## Fluxo de Uso

1. **Jogador Morre**: O GameController detecta que o jogador morreu
2. **Pausa o Jogo**: O motor do jogo é pausado
3. **Mostra Dialog**: A tela de game over aparece como dialog
4. **Usuário Escolhe**: Jogar novamente ou voltar ao login
5. **Ação Executada**: Dados resetados e navegação realizada

## Melhorias Implementadas

### **Antes vs Depois**
- **Antes**: Imagem estática com botão simples
- **Depois**: Tela animada com estatísticas e múltiplas opções

### **Experiência do Usuário**
- **Mais Informativa**: Mostra estatísticas da partida
- **Mais Opções**: Dois caminhos diferentes para continuar
- **Mais Atraente**: Animações e design moderno
- **Mais Consistente**: Mesmo estilo das outras telas

## Configuração

A tela de game over é automaticamente integrada ao sistema existente. Não requer configuração adicional além de:

1. Importar o widget no GameController
2. Substituir o dialog antigo pela nova tela
3. Garantir que as actions de reset estão funcionando

## Compatibilidade

- **Totalmente Compatível**: Funciona com o sistema existente
- **Sem Breaking Changes**: Não afeta outras funcionalidades
- **Reutilizável**: Pode ser usada em outros contextos se necessário 