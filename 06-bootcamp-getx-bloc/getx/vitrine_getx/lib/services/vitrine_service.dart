import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vitrine_getx/models/models.dart';

class VitrineService {
  Future<List<Produto>> buscarProdutos() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> listaDeDados = jsonDecode(response.body);

        return listaDeDados.map((item) => Produto.fromJson(item)).toList();
      } else {
        throw Exception('Falha ao carregar produtos do servidor');
      }
    } catch (e) {
      throw Exception("Falha ao buscar produtos");
    }
  }
}
