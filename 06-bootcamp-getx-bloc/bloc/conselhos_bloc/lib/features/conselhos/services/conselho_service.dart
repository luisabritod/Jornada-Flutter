import 'dart:convert';
import 'package:conselhos_bloc/features/conselhos/models/models.dart';
import 'package:http/http.dart' as http;

class ConselhoService {
  Future<Conselho> buscarConselho() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.adviceslip.com/advice'),
      );
      final json = jsonDecode(response.body);
      return Conselho.fromJson(json);
    } catch (e) {
      throw Exception('Falha ao buscar conselho: $e');
    }
  }
}
