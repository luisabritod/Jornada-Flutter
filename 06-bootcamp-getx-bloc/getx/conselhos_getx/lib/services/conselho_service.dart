import 'package:conselhos_getx/models/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// a função dele é falar com a internet e os dados
// não sabe o que é um widget, um conbtext, uma cor ou uma snackbar
// ele entrega os dados que foram solicitados e se falhar lança um erro

class ConselhoService {
  Future<ConselhoModel> buscarConselho() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.adviceslip.com/advice'),
      );
      final json = jsonDecode(response.body);
      return ConselhoModel.fromJson(json);
    } catch (e) {
      // aqui a gente não usa o Get.snackbar porque o service não pode e não deve saber que existe uma interface gráfica
      throw Exception('Falha ao buscar conselho: $e');
    }
  }
}
