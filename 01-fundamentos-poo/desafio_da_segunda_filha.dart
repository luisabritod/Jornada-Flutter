class Jogo {
  String nome;
  String genero;
  int anoDeLancamento;

  Jogo(this.nome, this.genero, this.anoDeLancamento);

  void exibirDetalhes() {
    print("Nome: $nome");
    print("Gênero: $genero");
    print("Ano de lançamento: $anoDeLancamento");
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
}

void main() {
  var jogoDaVida = JogoDeTabuleiro("Jogo da Vida", "Simulação", 1960, 2, 60);

  jogoDaVida.exibirDetalhes();
}
