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
}
