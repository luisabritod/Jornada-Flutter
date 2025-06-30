abstract class Jogo {
  String nome;
  String genero;
  int anoDeLancamento;

  Jogo(this.nome, this.genero, this.anoDeLancamento);

  void exibirDetalhes() {
    print("Nome: $nome");
    print("Gênero: $genero");
    print("Ano de lançamento: $anoDeLancamento");
  }

  void iniciarPartida();
}

class JogoDigital extends Jogo {
  double tamanhoEmGB;

  JogoDigital(String nome, String genero, int anoDeLancamento, this.tamanhoEmGB)
    : super(nome, genero, anoDeLancamento);

  @override
  void exibirDetalhes() {
    super.exibirDetalhes();
    print("Tamanho em GB: $tamanhoEmGB GB");
  }

  @override
  void iniciarPartida() {
    print("Iniciando $nome seu dispositivo...");
  }
}

class JogoDeTabuleiro extends Jogo {
  int numeroMinimoDeJogadores;
  int numeroDePecas;

  JogoDeTabuleiro(
    String nome,
    String genero,
    int anoDeLancamento,
    this.numeroMinimoDeJogadores,
    this.numeroDePecas,
  ) : super(nome, genero, anoDeLancamento);

  @override
  void exibirDetalhes() {
    super.exibirDetalhes();
    print("Número mínimo de jogadores: $numeroMinimoDeJogadores");
    print("Número de peças: $numeroDePecas");
  }

  @override
  void iniciarPartida() {
    print("Montando o tabuleiro para jogar $nome");
  }
}

class JogoDeCartas extends Jogo {
  int numeroDeCartas;

  JogoDeCartas(
    String nome,
    String genero,
    int anoDeLancamento,
    this.numeroDeCartas,
  ) : super(nome, genero, anoDeLancamento);

  @override
  void exibirDetalhes() {
    super.exibirDetalhes();
    print("Número de cartas: $numeroDeCartas");
  }

  @override
  void iniciarPartida() {
    print("Embaralhando as cartas para jogar $nome");
  }
}

void main() {
  var witcher3 = JogoDigital("The Witcher 3", "RPG", 2020, 50);
  var jogoDaVida = JogoDeTabuleiro("Jogo da Vida", "Simulação", 1960, 2, 60);
  var uno = JogoDeCartas("UNO", "Jogo de cartas", 1971, 108);

  // colocar em uma lista do tipo Jogo todos os filhos
  List<Jogo> minhaColecaoDeJogos = [witcher3, jogoDaVida, uno];

  // passando por cada jogo na minha coleção
  for (Jogo jogo in minhaColecaoDeJogos) {
    jogo.iniciarPartida();
    jogo.exibirDetalhes();

    print("======================");
  }
}
