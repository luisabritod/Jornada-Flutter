import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loja_getx_firebase/features/produtos/models/produto_model.dart';

class ProdutoService {
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
      throw Exception('Falha ao buscar produtos');
    }
  }
}
