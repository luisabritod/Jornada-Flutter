class Jogo {
  String nome;
  String genero;
  int anoDeLancamento;
  List<String> plataformas;

  Jogo(this.nome, this.genero, this.anoDeLancamento, this.plataformas);

  void exibirDetalhes() {
    print("Nome: $nome");
    print("Gênero: $genero");
    print("Ano de lançamento: $anoDeLancamento");
    print("Plataformas ${plataformas.join(', ')}");
  }
}

// JogoDigital herda de Jogo
class JogoDigital extends Jogo {
  // Atributo específico desta classe
  double tamanhoEmGB;

  // Construtor especial
  JogoDigital(
    String nome,
    String genero,
    int anoDeLancamento,
    List<String> plataformas,
    this.tamanhoEmGB, // o atributo novo a gente trata com this
  ) : super(
        nome,
        genero,
        anoDeLancamento,
        plataformas,
      ); // os atributos da mãe a gente passa para ela com super

  // Sobreescrevendo um método para adicionar mais infos
  @override
  void exibirDetalhes() {
    super
        .exibirDetalhes(); // primeiro, chama o método da mãe para não repetir código
    print(
      "Tamanho em GB: $tamanhoEmGB GB",
    ); // depois, adicione a informação nova
  }
}

void main() {
  var witcher3 = JogoDigital("The Witcher 3", "RPG", 2020, [
    "PC",
    "PlayStation",
    "Xbox",
  ], 50);

  witcher3.exibirDetalhes();
}
