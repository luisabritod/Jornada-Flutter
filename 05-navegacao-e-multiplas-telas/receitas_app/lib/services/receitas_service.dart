import 'dart:convert';

import 'package:receitas_app/models/models.dart';
import 'package:http/http.dart' as http;

class ReceitasService {
  Future<List<ReceitaResumo>> buscarReceitas() async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert",
        ),
      );

      // verifica se o sinal foi um sucesso
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> listaDeReceitas = json['meals'];

        // transformamos a lista de mapas em uma lista de objetos
        final receitas = listaDeReceitas
            .map((item) => ReceitaResumo.fromJson(item))
            .toList();

        // finalmente, retornamos a lista
        return receitas;
      } else {
        throw Exception('Falha ao carregar receitas');
      }
    } catch (e) {
      print(e);
      throw Exception('Falha ao carregar receitas $e');
    }
  }

  Future<ReceitaDetalhada> buscarDetalhesDaReceita(String id) async {
    try {
      final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id"),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);

        // a API de detalhes devolve uma lista "meals" com UM único item
        if (json['meals'] != null) {
          // pegamos o primeiro e único mapa de dados de dentro da lista "meals"
          final Map<String, dynamic> dadosDaReceita = json['meals'][0];

          return ReceitaDetalhada.fromJson(dadosDaReceita);
        } else {
          // se a API não encontrar a receita, a chave "meals" vem nula
          throw Exception('Receita não encontrada.');
        }
      } else {
        throw Exception('Falha ao carregar detalhes das receitas');
      }
    } catch (e) {
      print(e);
      throw Exception('Falha ao carregar receitas $e');
    }
  }
}
