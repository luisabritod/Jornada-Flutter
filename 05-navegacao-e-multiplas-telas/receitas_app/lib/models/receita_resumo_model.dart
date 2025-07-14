class ReceitaResumo {
  final String id;
  final String nome;
  final String urlImagem;

  ReceitaResumo({
    required this.id,
    required this.nome,
    required this.urlImagem,
  });

  factory ReceitaResumo.fromJson(Map<String, dynamic> json) {
    return ReceitaResumo(
      id: json["idMeal"],
      nome: json["strMeal"],
      urlImagem: json["strMealThumb"],
    );
  }
}
