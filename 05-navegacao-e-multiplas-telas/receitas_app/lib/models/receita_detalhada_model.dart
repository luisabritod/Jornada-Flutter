class ReceitaDetalhada {
  final String id;
  final String nome;
  final String urlImagem;
  final String instrucoes;
  final List<String> ingredientes;

  ReceitaDetalhada({
    required this.id,
    required this.nome,
    required this.urlImagem,
    required this.instrucoes,
    required this.ingredientes,
  });

  factory ReceitaDetalhada.fromJson(Map<String, dynamic> json) {
    // criamos uma lista vazia para guardar os ingredientes
    List<String> ingredientesDaReceita = [];

    // fazemos um laço de 1 a 20(máximo de ingredientes da API)
    for (int i = 1; i <= 20; i++) {
      final ingrediente = json["strIngredient$i"];
      final medida = json["strMeasure$i"];

      // verificamos se o ingrediente existe e não está vazio
      if (ingrediente != null && ingrediente.isNotEmpty) {
        // se existir, juntamos a medida e o ingrediente e adicionamos à lista
        ingredientesDaReceita.add('$medida $ingrediente');
      } else {
        // se encontrarmos um ingrediente vazio, paramos o laço
        break;
      }
    }
    return ReceitaDetalhada(
      id: json["idMeal"],
      nome: json["strMeal"],
      urlImagem: json["strMealThumb"],
      instrucoes: json["strInstructions"],
      ingredientes: ingredientesDaReceita,
    );
  }
}
