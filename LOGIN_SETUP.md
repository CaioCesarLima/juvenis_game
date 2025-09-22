# Configuração da Tela de Login

## Visão Geral

A tela de login foi criada seguindo o mesmo estilo visual da splash screen, com um design moderno e animações suaves. Ela permite que os usuários acessem o jogo através de um código de acesso validado no Supabase.

## Funcionalidades

- **Design Consistente**: Segue o mesmo estilo da splash screen com gradiente escuro e elementos roxos
- **Animações**: Inclui animações de fade e scale para uma experiência visual agradável
- **Validação**: Verifica se o código existe na tabela 'players' do Supabase
- **Carregamento de Dados**: Carrega automaticamente os dados do jogador após login bem-sucedido
- **Tratamento de Erros**: Exibe mensagens de erro claras para o usuário
- **Navegação**: Redireciona para o GameRouter após login bem-sucedido

## Estrutura do Banco de Dados

A tela de login espera uma tabela `players` no Supabase com a seguinte estrutura:

```sql
CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  code VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  level INTEGER DEFAULT 1,
  light INTEGER DEFAULT 1,
  score INTEGER DEFAULT 0
);
```

## Exemplo de Dados

```sql
INSERT INTO players (code, name, level, light, score) 
VALUES ('1235', 'Caio', 2, 1, 0);
```

## Como Usar

1. **Configuração Inicial**: As credenciais do Supabase já estão configuradas no arquivo `lib/config/supabase_config.dart`

2. **Executar o App**: O app agora inicia na tela de login em vez de ir direto para o jogo

3. **Login**: 
   - Digite o código de acesso no campo de texto
   - Clique em "ENTRAR NO JOGO"
   - Se o código for válido, o usuário será redirecionado para o GameRouter

4. **Fluxo de Navegação**:
   ```
   LoginPage → GameRouter → Fase01/Fase02 (baseado no nível do jogador)
   ```

## Arquivos Modificados/Criados

- `lib/config/supabase_config.dart` - Configuração centralizada do Supabase
- `lib/widgets/login_page.dart` - Tela de login principal
- `lib/main.dart` - Atualizado para usar LoginPage como tela inicial

## Estilo Visual

- **Cores**: Gradiente escuro (preto, azul escuro, roxo)
- **Elementos**: Roxo accent para destaque
- **Tipografia**: Fonte branca com sombra roxa para o título
- **Animações**: Fade in e scale com elastic effect
- **Campos**: Campo de texto com borda roxa e ícone de chave
- **Botão**: Botão roxo com efeito de sombra

## Tratamento de Erros

- Código inválido: "Código inválido. Tente novamente."
- Erro de conexão: "Erro ao conectar. Verifique sua conexão."
- Campo vazio: "Por favor, digite o código"

## Segurança

- O código é validado no servidor Supabase
- Não há armazenamento local de credenciais
- Cada código é único na tabela de jogadores 