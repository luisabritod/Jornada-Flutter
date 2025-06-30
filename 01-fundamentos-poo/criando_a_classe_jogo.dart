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

void main() {
  var witcher3 = Jogo("The Witcher 3", "RPG", 2020, [
    "PC",
    "PlayStation",
    "Xbox",
  ]);

  witcher3.exibirDetalhes();
}
