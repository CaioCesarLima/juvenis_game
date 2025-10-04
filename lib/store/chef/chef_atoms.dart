import 'package:asp/asp.dart';
import 'package:juvenis_bonfire/store/chef/option_model.dart';
import 'package:juvenis_bonfire/store/chef/question_model.dart';
import 'package:juvenis_bonfire/store/user/user_atoms.dart';
import 'package:logger/logger.dart';

final question = atom<int>(-1);
final correctAnswers = atom<int>(0);
final chefLife = atom<int>(questions.state.length * 10);
final isPlayerNearChef = atom<bool>(false);

final questions = atom<List<QuestionModel>>(
  getQuestions[userLevel.state.toInt()]!,
);

final nextQuestion = atomAction((set) {
  set(question, question.state + 1);
});
final correctUp = atomAction((set) {
  set(correctAnswers, correctAnswers.state + 1);
});

final receiveDamage = atomAction((set) {
  Logger().w("recebeu ataque");
  set(chefLife, chefLife.state - 10);
});
final reset = atomAction((set) {
  set(question, -1);
  set(correctAnswers, 0);
  set(questions, getQuestions[userLevel.state.toInt()] ?? getQuestions[1]!);
  set(chefLife, questions.state.length * 10);
  Logger().d(chefLife.state);
  set(isPlayerNearChef, false);
});

final setPlayerNearChef = atomAction((set) {
  print("está perto");
  set(isPlayerNearChef, true);
});

final setPlayerAwayFromChef = atomAction((set) {
  print("está longe");
  set(isPlayerNearChef, false);
});

final setChefLife = atomAction((set) {
  set(chefLife, questions.state.length * 10);
});

Map<int, List<QuestionModel>> getQuestions = {
  1: [
    // Lição 1 — Natã reprova o rei Davi (2Sm 11–12)
    QuestionModel(
      text:
          "Na parábola de Natã, o homem rico tomou de quem a única cordeirinha?",
      options: [
        OptionModel(text: "Do homem pobre", isCorrect: true),
        OptionModel(text: "Do vizinho rico", isCorrect: false),
        OptionModel(text: "De um viajante", isCorrect: false),
        OptionModel(text: "Do rei", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual foi a reação de Davi quando Natã confrontou seu pecado?",
      options: [
        OptionModel(text: "Fugiu de Jerusalém", isCorrect: false),
        OptionModel(
          text: "Se arrependeu e reconheceu seu erro",
          isCorrect: true,
        ),
        OptionModel(text: "Mandou prender Natã", isCorrect: false),
        OptionModel(text: "Negou tudo", isCorrect: false),
      ],
    ),
    QuestionModel(
      text:
          "A mensagem central da lição diz que tudo o que fazemos e dizemos afeta:",
      options: [
        OptionModel(text: "Apenas a nós mesmos", isCorrect: false),
        OptionModel(text: "Os que nos rodeiam", isCorrect: true),
        OptionModel(text: "Somente a família", isCorrect: false),
        OptionModel(text: "Apenas a igreja", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Quais textos bíblicos fundamentam o confronto de Natã a Davi?",
      options: [
        OptionModel(text: "2 Samuel 12:1-15 (com 11:14-25)", isCorrect: true),
        OptionModel(text: "1 Samuel 17 e 18", isCorrect: false),
        OptionModel(text: "Salmo 100", isCorrect: false),
        OptionModel(text: "Eclesiastes 4:9-10", isCorrect: false),
      ],
    ),
  ],

  2: [
    // Lição 2 — Absalão intenta o mal (2Sm 14:25–15:37)
    QuestionModel(
      text:
          "Qual estratégia Absalão usou para conquistar o povo antes da revolta?",
      options: [
        OptionModel(text: "Fez alianças com filisteus", isCorrect: false),
        OptionModel(
          text: "Ganhou o coração do povo com gestos e promessas",
          isCorrect: true,
        ),
        OptionModel(text: "Fortaleceu o exército de Joabe", isCorrect: false),
        OptionModel(text: "Destruiu a sinagoga", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Segundo a lição, conseguimos mais quando:",
      options: [
        OptionModel(text: "Competimos entre nós", isCorrect: false),
        OptionModel(text: "Trabalhamos sozinhos", isCorrect: false),
        OptionModel(text: "Trabalhamos juntos", isCorrect: true),
        OptionModel(text: "Buscamos poder", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual é o verso para decorar da Lição 2?",
      options: [
        OptionModel(text: "Tiago 3:18", isCorrect: false),
        OptionModel(text: "Eclesiastes 9:18", isCorrect: false),
        OptionModel(text: "Eclesiastes 4:9-10", isCorrect: true),
        OptionModel(text: "Mateus 5:44-45", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Quem Absalão estava traindo ao tramar sua conspiração?",
      options: [
        OptionModel(text: "Seu pai, o rei Davi", isCorrect: true),
        OptionModel(text: "O profeta Natã", isCorrect: false),
        OptionModel(text: "O sacerdote Zadoque", isCorrect: false),
        OptionModel(text: "O comandante Amasa", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A atitude de Absalão resultou em:",
      options: [
        OptionModel(text: "Paz e união", isCorrect: false),
        OptionModel(text: "Guerra civil e divisão", isCorrect: true),
        OptionModel(text: "Avivamento espiritual", isCorrect: false),
        OptionModel(text: "Reconstrução do Templo", isCorrect: false),
      ],
    ),
  ],

  3: [
    // Lição 3 — Davi lamenta a morte de Absalão (2Sm 16:15–18:33)
    QuestionModel(
      text:
          "Qual foi o pedido de Davi aos comandantes sobre Absalão antes da batalha?",
      options: [
        OptionModel(text: "Que o expulsassem do país", isCorrect: false),
        OptionModel(text: "Que o tratassem com bondade", isCorrect: true),
        OptionModel(text: "Que o prendessem vivo", isCorrect: false),
        OptionModel(text: "Que o ignorassem", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Quem matou Absalão, contrariando o desejo de Davi?",
      options: [
        OptionModel(text: "Amasa", isCorrect: false),
        OptionModel(text: "Zadoque", isCorrect: false),
        OptionModel(text: "Joabe", isCorrect: true),
        OptionModel(text: "Mefibosete", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Como Davi reagiu à notícia da morte de Absalão?",
      options: [
        OptionModel(text: "Festejou a vitória", isCorrect: false),
        OptionModel(text: "Permaneceu indiferente", isCorrect: false),
        OptionModel(
          text: "Lamentou profundamente por seu filho",
          isCorrect: true,
        ),
        OptionModel(text: "Destituiu seus comandantes", isCorrect: false),
      ],
    ),
    QuestionModel(
      text:
          "A mensagem central desta lição enfatiza que refletimos o amor de Deus quando somos:",
      options: [
        OptionModel(text: "Valentes e rigorosos", isCorrect: false),
        OptionModel(text: "Pacientes e bondosos com outros", isCorrect: true),
        OptionModel(text: "Prontos para punir", isCorrect: false),
        OptionModel(text: "Adeptos à justiça própria", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual é o verso para decorar da Lição 3?",
      options: [
        OptionModel(text: "Romanos 10:12-13", isCorrect: false),
        OptionModel(text: "Mateus 5:44-45", isCorrect: true),
        OptionModel(text: "Hebreus 12:2", isCorrect: false),
        OptionModel(text: "João 1:1-3", isCorrect: false),
      ],
    ),
    QuestionModel(
      text:
          "Esta lição compara o amor de Davi por Absalão com que realidade espiritual?",
      options: [
        OptionModel(text: "A aliança de Noé", isCorrect: false),
        OptionModel(
          text: "A paciência e o amor de Deus por nós",
          isCorrect: true,
        ),
        OptionModel(text: "O zelo de Elias", isCorrect: false),
        OptionModel(text: "A sabedoria de Salomão", isCorrect: false),
      ],
    ),
  ],

  4: [
    // Lição 4 — Davi promove reconciliação (2Sm 19)
    QuestionModel(
      text: "Após a derrota de Absalão, Davi trabalhou para restaurar:",
      options: [
        OptionModel(text: "O Templo", isCorrect: false),
        OptionModel(text: "A economia", isCorrect: false),
        OptionModel(
          text: "A paz e a reconciliação em Israel e Judá",
          isCorrect: true,
        ),
        OptionModel(text: "A aliança com filisteus", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Quem Davi nomeou sobre o exército no lugar de Joabe?",
      options: [
        OptionModel(text: "Abisai", isCorrect: false),
        OptionModel(text: "Amasa", isCorrect: true),
        OptionModel(text: "Benaia", isCorrect: false),
        OptionModel(text: "Zeruia", isCorrect: false),
      ],
    ),
    QuestionModel(
      text:
          "Qual tribo poderia reacender conflito se Davi não lidasse bem com ela?",
      options: [
        OptionModel(text: "Judá", isCorrect: false),
        OptionModel(text: "Benjamim", isCorrect: true),
        OptionModel(text: "Efraim", isCorrect: false),
        OptionModel(text: "Issacar", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "O verso para decorar desta lição afirma que os pacificadores:",
      options: [
        OptionModel(text: "Herdarão a Terra", isCorrect: false),
        OptionModel(
          text: "Plantarão sementes de paz e colherão justiça (Tg 3:18)",
          isCorrect: true,
        ),
        OptionModel(text: "Verão a Deus", isCorrect: false),
        OptionModel(text: "Serão chamados filhos de Abraão", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A mensagem central ensina que resolver problemas pacificamente é:",
      options: [
        OptionModel(text: "Apenas uma opção", isCorrect: false),
        OptionModel(
          text: "Parte do propósito de Deus para nós",
          isCorrect: true,
        ),
        OptionModel(text: "Desnecessário", isCorrect: false),
        OptionModel(text: "Somente para líderes", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Entre os benjamitas que foram ao encontro de Davi estava:",
      options: [
        OptionModel(text: "Simei", isCorrect: true),
        OptionModel(text: "Calebe", isCorrect: false),
        OptionModel(text: "Urias", isCorrect: false),
        OptionModel(text: "Jonas", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Davi é citado como exemplo de que tipo de liderança nesta crise?",
      options: [
        OptionModel(text: "Autoritário e centralizador", isCorrect: false),
        OptionModel(
          text: "Habilidoso em reconciliação e visão futura",
          isCorrect: true,
        ),
        OptionModel(text: "Indiferente aos conselhos", isCorrect: false),
        OptionModel(
          text: "Dependente de exércitos estrangeiros",
          isCorrect: false,
        ),
      ],
    ),
  ],

  5: [
    // Lição 5 — Jesus servia desde a infância (Lc 2:51-52)
    QuestionModel(
      text: "Segundo Lucas 2:52, Jesus crescia em sabedoria, estatura e:",
      options: [
        OptionModel(text: "Riqueza", isCorrect: false),
        OptionModel(text: "Força", isCorrect: false),
        OptionModel(
          text: "Graça, diante de Deus e dos homens",
          isCorrect: true,
        ),
        OptionModel(text: "Conhecimento dos anjos", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A lição destaca que, mesmo jovem, Jesus:",
      options: [
        OptionModel(text: "Evitava tarefas domésticas", isCorrect: false),
        OptionModel(
          text: "Viveu para servir e abençoar outros",
          isCorrect: true,
        ),
        OptionModel(text: "Buscou influência política", isCorrect: false),
        OptionModel(text: "Não se envolvia com a comunidade", isCorrect: false),
      ],
    ),
    QuestionModel(
      text:
          "Qual destas atitudes descreve o caráter de Jesus jovem segundo a lição?",
      options: [
        OptionModel(text: "Impaciente", isCorrect: false),
        OptionModel(text: "Cortesia desinteressada", isCorrect: true),
        OptionModel(text: "Orgulhoso", isCorrect: false),
        OptionModel(text: "Indiferente", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual a mensagem central da Lição 5?",
      options: [
        OptionModel(text: "Servir é só para adultos", isCorrect: false),
        OptionModel(
          text: "Como Jesus, podemos servir em qualquer idade",
          isCorrect: true,
        ),
        OptionModel(text: "Devemos esperar instrução formal", isCorrect: false),
        OptionModel(text: "Serviço não é essencial", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual verso também é citado com Lucas 2:52?",
      options: [
        OptionModel(text: "Marcos 10:45", isCorrect: true),
        OptionModel(text: "Romanos 10:12-13", isCorrect: false),
        OptionModel(text: "João 1:1-3", isCorrect: false),
        OptionModel(text: "Tiago 3:18", isCorrect: false),
      ],
    ),
    QuestionModel(
      text:
          "A lição menciona que até a vida dos animais em Nazaré era mais feliz porque:",
      options: [
        OptionModel(text: "Havia novas leis", isCorrect: false),
        OptionModel(text: "Jesus estava ali", isCorrect: true),
        OptionModel(text: "José era carpinteiro", isCorrect: false),
        OptionModel(text: "Havia menos impostos", isCorrect: false),
      ],
    ),
    QuestionModel(
      text:
          "Que duas palavras descrevem a atitude de um servo segundo o estudo?",
      options: [
        OptionModel(text: "Prestígio e autoridade", isCorrect: false),
        OptionModel(text: "Poder e reconhecimento", isCorrect: false),
        OptionModel(text: "Humildade e perdão", isCorrect: true),
        OptionModel(text: "Isolamento e silêncio", isCorrect: false),
      ],
    ),
  ],

  6: [
    // Lição 6 — Jesus cura o filho de um oficial (Jo 4:46-54)
    QuestionModel(
      text:
          "O oficial percorreu cerca de quantos quilômetros de Cafarnaum a Caná?",
      options: [
        OptionModel(text: "5 km", isCorrect: false),
        OptionModel(text: "30 km", isCorrect: true),
        OptionModel(text: "60 km", isCorrect: false),
        OptionModel(text: "100 km", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "O que Jesus disse ao oficial, testando sua fé?",
      options: [
        OptionModel(
          text: "“Jamais crerão, a menos que vejam sinais e maravilhas”",
          isCorrect: true,
        ),
        OptionModel(text: "“Tragam ofertas ao Templo”", isCorrect: false),
        OptionModel(
          text: "“Volte quando seu filho melhorar”",
          isCorrect: false,
        ),
        OptionModel(text: "“Eu não posso curar gentios”", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual foi o resultado final para o oficial e sua casa?",
      options: [
        OptionModel(text: "Foram expulsos da sinagoga", isCorrect: false),
        OptionModel(text: "Voltaram tristes", isCorrect: false),
        OptionModel(text: "Creram em Jesus", isCorrect: true),
        OptionModel(text: "Mudaram-se para Jerusalém", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A mensagem central afirma que Jesus usa nosso serviço para:",
      options: [
        OptionModel(text: "Ganhar debates", isCorrect: false),
        OptionModel(text: "Ajudar outros a confiar Nele", isCorrect: true),
        OptionModel(text: "Evitar sofrimentos", isCorrect: false),
        OptionModel(text: "Organizar o exército", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual é o verso para decorar da Lição 6?",
      options: [
        OptionModel(text: "Mateus 9:36-38", isCorrect: true),
        OptionModel(text: "Lucas 2:52", isCorrect: false),
        OptionModel(text: "Hebreus 12:2", isCorrect: false),
        OptionModel(text: "Romanos 10:12-13", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "O oficial demonstrou fé quando:",
      options: [
        OptionModel(text: "Exigiu um sinal imediato", isCorrect: false),
        OptionModel(
          text: "Voltou para casa confiando apenas na palavra de Jesus",
          isCorrect: true,
        ),
        OptionModel(text: "Levou Jesus à força", isCorrect: false),
        OptionModel(text: "Convocou os anciãos", isCorrect: false),
      ],
    ),
    QuestionModel(
      text:
          "Jesus, ao enviar discípulos em Lucas 9:1-6, ensinou que eles deveriam:",
      options: [
        OptionModel(
          text: "Depender inteiramente de Deus e servir onde fossem recebidos",
          isCorrect: true,
        ),
        OptionModel(text: "Levar muitos recursos", isCorrect: false),
        OptionModel(text: "Evitar casas simples", isCorrect: false),
        OptionModel(text: "Permanecer apenas no Templo", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual necessidade moveu o oficial a buscar Jesus?",
      options: [
        OptionModel(text: "Fome", isCorrect: false),
        OptionModel(text: "Doença de seu filho", isCorrect: true),
        OptionModel(text: "Conflito político", isCorrect: false),
        OptionModel(text: "Impostos elevados", isCorrect: false),
      ],
    ),
  ],

  7: [
    // Lição 7 — Centurião e o servo (Lc 7:1-10)
    QuestionModel(
      text: "Que atitude o centurião demonstrou em relação a Jesus?",
      options: [
        OptionModel(text: "Arrogância militar", isCorrect: false),
        OptionModel(text: "Indiferença religiosa", isCorrect: false),
        OptionModel(text: "Humildade e grande fé", isCorrect: true),
        OptionModel(text: "Desconfiança", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "O centurião acreditava que Jesus podia curar seu servo apenas:",
      options: [
        OptionModel(text: "Indo até sua casa", isCorrect: false),
        OptionModel(text: "Se fosse sábado", isCorrect: false),
        OptionModel(text: "Dizendo uma palavra", isCorrect: true),
        OptionModel(text: "Com oferta no Templo", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual foi o testemunho de Jesus sobre a fé do centurião?",
      options: [
        OptionModel(text: "Era comum em Israel", isCorrect: false),
        OptionModel(
          text: "Jamais viu fé como aquela em Israel",
          isCorrect: true,
        ),
        OptionModel(text: "Era insuficiente", isCorrect: false),
        OptionModel(text: "Era superstição", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Segundo a lição, à medida que nossa fé se desenvolve:",
      options: [
        OptionModel(
          text: "Aumenta nossa habilidade para servir",
          isCorrect: true,
        ),
        OptionModel(text: "Precisamos servir menos", isCorrect: false),
        OptionModel(text: "Devemos evitar desafios", isCorrect: false),
        OptionModel(text: "Ficamos independentes de Deus", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual é o verso para decorar da Lição 7?",
      options: [
        OptionModel(text: "Hebreus 12:2", isCorrect: true),
        OptionModel(text: "João 1:1-3", isCorrect: false),
        OptionModel(text: "Tiago 3:18", isCorrect: false),
        OptionModel(text: "Mateus 9:36-38", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "O centurião tinha boa reputação entre os judeus porque:",
      options: [
        OptionModel(text: "Construíra uma sinagoga para eles", isCorrect: true),
        OptionModel(text: "Era escriba", isCorrect: false),
        OptionModel(text: "Era sacerdote", isCorrect: false),
        OptionModel(text: "Vivia em Jerusalém", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "O servo do centurião foi curado quando:",
      options: [
        OptionModel(
          text: "Jesus chegou à casa e impôs as mãos",
          isCorrect: false,
        ),
        OptionModel(
          text: "Jesus disse uma palavra, à distância",
          isCorrect: true,
        ),
        OptionModel(
          text: "Os anciãos ofereceram sacrifícios",
          isCorrect: false,
        ),
        OptionModel(text: "O centurião fez voto", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual traço do centurião contrasta com a lei romana sobre servos?",
      options: [
        OptionModel(text: "Desprezo por servos", isCorrect: false),
        OptionModel(
          text: "Cuidado e afeto por seu servo doente",
          isCorrect: true,
        ),
        OptionModel(text: "Abandono do servo", isCorrect: false),
        OptionModel(text: "Violência contra o servo", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A fé do centurião se baseou também em sua experiência como:",
      options: [
        OptionModel(text: "Publicano", isCorrect: false),
        OptionModel(
          text: "Soldado que dá ordens e elas são cumpridas",
          isCorrect: true,
        ),
        OptionModel(text: "Pescador", isCorrect: false),
        OptionModel(text: "Carpinteiro", isCorrect: false),
      ],
    ),
  ],

  8: [
    // Lição 8 — Mulher siro-fenícia (Mc 7:24-30)
    QuestionModel(
      text: "De que região era a mulher que pediu cura a Jesus para sua filha?",
      options: [
        OptionModel(text: "Siro-Fenícia (gentia)", isCorrect: true),
        OptionModel(text: "Samaria", isCorrect: false),
        OptionModel(text: "Judeia", isCorrect: false),
        OptionModel(text: "Galileia", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Ao falar de 'migalhas para os cachorrinhos', Jesus estava:",
      options: [
        OptionModel(text: "Desprezando a mulher", isCorrect: false),
        OptionModel(
          text: "Usando um diminutivo carinhoso que a encorajou a insistir",
          isCorrect: true,
        ),
        OptionModel(text: "Falando de cães de rua", isCorrect: false),
        OptionModel(text: "Negando a bênção aos gentios", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A resposta da mulher mostrou uma fé que:",
      options: [
        OptionModel(text: "Desistia facilmente", isCorrect: false),
        OptionModel(
          text: "Não aceitaria um 'não' e confiava na graça",
          isCorrect: true,
        ),
        OptionModel(text: "Dependia de rituais no Templo", isCorrect: false),
        OptionModel(text: "Rejeitava Israel", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual é o verso para decorar desta lição?",
      options: [
        OptionModel(text: "Romanos 10:12-13", isCorrect: true),
        OptionModel(text: "Mateus 5:44-45", isCorrect: false),
        OptionModel(text: "Lucas 2:52", isCorrect: false),
        OptionModel(text: "Hebreus 12:2", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A mensagem central ensina que Jesus nos chama a servir:",
      options: [
        OptionModel(text: "Apenas a judeus", isCorrect: false),
        OptionModel(text: "Somente aos amigos", isCorrect: false),
        OptionModel(
          text: "A todas as pessoas, mesmo diferentes de nós",
          isCorrect: true,
        ),
        OptionModel(text: "Somente aos ricos", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Cite outro exemplo de Jesus sem preconceito indicado na lição:",
      options: [
        OptionModel(text: "A mulher samaritana em João 4", isCorrect: true),
        OptionModel(text: "A destruição de Sodoma", isCorrect: false),
        OptionModel(text: "A visita a Nicodemos", isCorrect: false),
        OptionModel(text: "A parábola do rico e Lázaro", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Após a fala de Jesus, a situação da filha daquela mulher foi:",
      options: [
        OptionModel(text: "Permaneceu doente", isCorrect: false),
        OptionModel(text: "Curada: o demônio saiu dela", isCorrect: true),
        OptionModel(text: "Aguardou sete dias", isCorrect: false),
        OptionModel(text: "Teve de ir a Jerusalém", isCorrect: false),
      ],
    ),
    QuestionModel(
      text:
          "O que a metáfora do pão e migalhas simboliza no ensino de Jesus ali?",
      options: [
        OptionModel(
          text: "As bênçãos de Deus primeiro a Israel, mas também aos gentios",
          isCorrect: true,
        ),
        OptionModel(text: "Apenas alimento literal", isCorrect: false),
        OptionModel(text: "A lei cerimonial", isCorrect: false),
        OptionModel(text: "Silêncio profético", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "De acordo com a lição, não fazer acepção de pessoas é agir:",
      options: [
        OptionModel(text: "Contra a vontade de Deus", isCorrect: true),
        OptionModel(text: "Com neutralidade", isCorrect: false),
        OptionModel(text: "Com prudência social", isCorrect: false),
        OptionModel(text: "Segundo a tradição", isCorrect: false),
      ],
    ),
  ],

  9: [
    // Lições 9 e 10 — João 1:1-18; Mateus 1
    QuestionModel(
      text: "Segundo João 1:1-3, quem é o Verbo e desde quando Ele existe?",
      options: [
        OptionModel(text: "Um profeta, desde Abraão", isCorrect: false),
        OptionModel(
          text: "Jesus, desde o princípio, e Ele é Deus",
          isCorrect: true,
        ),
        OptionModel(text: "Um anjo criado no Éden", isCorrect: false),
        OptionModel(text: "João Batista, desde o nascimento", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual é a mensagem central da Lição 9?",
      options: [
        OptionModel(text: "A lei foi dada antes da graça", isCorrect: false),
        OptionModel(
          text: "Jesus é o maior presente da graça dado antes da criação",
          isCorrect: true,
        ),
        OptionModel(text: "A graça é só para Israel", isCorrect: false),
        OptionModel(text: "A criação não depende do Verbo", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A Lição 10 destaca que a graça de Deus se revela quando:",
      options: [
        OptionModel(
          text: "Jesus correu grande risco para nos salvar",
          isCorrect: true,
        ),
        OptionModel(
          text: "José recusou-se a casar com Maria",
          isCorrect: false,
        ),
        OptionModel(
          text: "Os magos voltaram pelo mesmo caminho",
          isCorrect: false,
        ),
        OptionModel(text: "Herodes adorou o Menino", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Em Mateus 1, qual foi a decisão de José após o sonho do anjo?",
      options: [
        OptionModel(text: "Abandonar Maria em segredo", isCorrect: false),
        OptionModel(
          text: "Casar-se com Maria, confiando na palavra de Deus",
          isCorrect: true,
        ),
        OptionModel(text: "Ir para Roma", isCorrect: false),
        OptionModel(text: "Esperar até o recenseamento", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual é o verso para decorar da Lição 10?",
      options: [
        OptionModel(text: "Isaías 53:5", isCorrect: true),
        OptionModel(text: "Romanos 10:12-13", isCorrect: false),
        OptionModel(text: "Lucas 2:52", isCorrect: false),
        OptionModel(text: "Tiago 3:18", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "De acordo com João 1, o Verbo veio para:",
      options: [
        OptionModel(text: "Condenar o mundo imediatamente", isCorrect: false),
        OptionModel(
          text: "Revelar o amor do Pai e dar-nos vida",
          isCorrect: true,
        ),
        OptionModel(text: "Apenas cumprir ritos", isCorrect: false),
        OptionModel(text: "Reinar politicamente", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A encarnação de Jesus segundo as lições indica que Deus é:",
      options: [
        OptionModel(text: "Austero e distante", isCorrect: false),
        OptionModel(
          text: "Semelhante a Jesus: amoroso e próximo",
          isCorrect: true,
        ),
        OptionModel(text: "Mutável e imprevisível", isCorrect: false),
        OptionModel(text: "Limitado como os deuses pagãos", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "O nome ‘Jesus’ em Mateus 1 aponta para qual missão?",
      options: [
        OptionModel(text: "Ensinar parábolas somente", isCorrect: false),
        OptionModel(text: "Salvar Seu povo dos pecados", isCorrect: true),
        OptionModel(text: "Unificar impérios", isCorrect: false),
        OptionModel(text: "Reformar o Sinédrio", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Segundo João 1:14, o Verbo ‘Se fez carne e’:",
      options: [
        OptionModel(text: "Habitou entre nós", isCorrect: true),
        OptionModel(text: "Reinou em Roma", isCorrect: false),
        OptionModel(text: "Aboliu a lei moral", isCorrect: false),
        OptionModel(text: "Escreveu livros", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A atitude de José ao casar com Maria demonstra:",
      options: [
        OptionModel(text: "Medo dos fariseus", isCorrect: false),
        OptionModel(
          text: "Obediência e fé na orientação de Deus",
          isCorrect: true,
        ),
        OptionModel(text: "Busca de status", isCorrect: false),
        OptionModel(text: "Preferência política", isCorrect: false),
      ],
    ),
  ],

  10: [
    // Lições 11–13 — Lucas 2:1-40; Ap 21–22; Êx 20 + Mt 22 + Jo 14:15 + Ap 14:12 + Rm 3:24
    QuestionModel(
      text: "A Lição 11 ensina que Jesus veio ser como um de nós para:",
      options: [
        OptionModel(text: "Revelar o caráter amoroso de Deus", isCorrect: true),
        OptionModel(text: "Estabelecer um reino político", isCorrect: false),
        OptionModel(text: "Abolir toda tradição", isCorrect: false),
        OptionModel(text: "Exaltar os romanos", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual é o verso para decorar da Lição 11?",
      options: [
        OptionModel(text: "Lucas 2:11", isCorrect: true),
        OptionModel(text: "Romanos 3:24", isCorrect: false),
        OptionModel(text: "Apocalipse 21:1-2", isCorrect: false),
        OptionModel(text: "Mateus 22:37-40", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A Lição 12 (Ap 21–22) ressalta que teremos vida eterna se:",
      options: [
        OptionModel(text: "Guardarmos tradições humanas", isCorrect: false),
        OptionModel(text: "Aceitarmos o dom de Deus", isCorrect: true),
        OptionModel(text: "Formos ricos", isCorrect: false),
        OptionModel(text: "Cumprirmos leis civis", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual visão João descreve em Apocalipse 21?",
      options: [
        OptionModel(text: "A queda de Babilônia", isCorrect: false),
        OptionModel(
          text: "Novo céu e nova terra, e a Nova Jerusalém",
          isCorrect: true,
        ),
        OptionModel(text: "O trono de Salomão", isCorrect: false),
        OptionModel(text: "A estátua de Nabucodonosor", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A Lição 13 destaca que Deus escreve Sua lei de amor onde?",
      options: [
        OptionModel(text: "Em tábuas de pedra novamente", isCorrect: false),
        OptionModel(text: "Em nosso coração", isCorrect: true),
        OptionModel(text: "Nas portas da cidade", isCorrect: false),
        OptionModel(text: "Somente no Templo", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Qual conjunto de textos fundamenta a Lição 13?",
      options: [
        OptionModel(
          text: "Êx 20; Mt 22:34-40; Jo 14:15; Ap 14:12; Rm 3:24",
          isCorrect: true,
        ),
        OptionModel(text: "Gn 1–2; Sl 23; Pv 3", isCorrect: false),
        OptionModel(text: "Dn 2; Dn 7; Dn 8", isCorrect: false),
        OptionModel(text: "At 2; At 15; Gl 5", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Segundo Mateus 22:37-40, a lei de Deus se resume em:",
      options: [
        OptionModel(text: "Ritos e cerimônias", isCorrect: false),
        OptionModel(text: "Amor a Deus e ao próximo", isCorrect: true),
        OptionModel(text: "Dietas e votos", isCorrect: false),
        OptionModel(text: "Promessas e juramentos", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Apocalipse 22 descreve uma cidade onde:",
      options: [
        OptionModel(text: "Há morte e dor", isCorrect: false),
        OptionModel(
          text: "Não há maldição, e o rio da vida flui do trono de Deus",
          isCorrect: true,
        ),
        OptionModel(text: "O mar cobre tudo", isCorrect: false),
        OptionModel(text: "A noite é mais escura", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "De acordo com João 14:15, amar a Jesus implica:",
      options: [
        OptionModel(text: "Conhecer genealogias", isCorrect: false),
        OptionModel(text: "Guardar Seus mandamentos", isCorrect: true),
        OptionModel(text: "Apenas participar de festas", isCorrect: false),
        OptionModel(text: "Construir altares", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Romanos 3:24 afirma que somos justificados:",
      options: [
        OptionModel(text: "Pelas obras", isCorrect: false),
        OptionModel(
          text: "Gratuitamente, por Sua graça, mediante a redenção em Cristo",
          isCorrect: true,
        ),
        OptionModel(text: "Pelos sacrifícios", isCorrect: false),
        OptionModel(text: "Pela linhagem de Abraão", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "Apocalipse 14:12 descreve o povo de Deus como os que:",
      options: [
        OptionModel(
          text: "Guardam os mandamentos de Deus e a fé em Jesus",
          isCorrect: true,
        ),
        OptionModel(text: "Buscam sinais", isCorrect: false),
        OptionModel(text: "Reprovam a graça", isCorrect: false),
        OptionModel(text: "Vivem sem fé", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A encarnação (Lc 2:1-40) nos ajuda a compreender:",
      options: [
        OptionModel(
          text: "O caráter amoroso de Deus revelado em Jesus",
          isCorrect: true,
        ),
        OptionModel(text: "A supremacia dos anjos", isCorrect: false),
        OptionModel(text: "A cultura greco-romana", isCorrect: false),
        OptionModel(text: "A cronologia dos reis", isCorrect: false),
      ],
    ),
    QuestionModel(
      text: "A promessa da vida eterna em Ap 21–22 é para os que:",
      options: [
        OptionModel(text: "Se inscrevem em genealogias", isCorrect: false),
        OptionModel(text: "Aceitam o dom de Deus em Cristo", isCorrect: true),
        OptionModel(text: "Conquistam reinos", isCorrect: false),
        OptionModel(text: "Guardam tradições humanas", isCorrect: false),
      ],
    ),
  ],
};
