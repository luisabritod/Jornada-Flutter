import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vitrine_app/models/produto_model.dart';
import 'package:http/http.dart' as http;

class ProdutoProvider extends ChangeNotifier {
  List<Produto> _produtos = [];
  bool _carregando = false;

  List<Produto> get produtos => _produtos;
  bool get carregando => _carregando;

  void buscarProdutos() async {
    _carregando = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      final json = jsonDecode(response.body);

      final List<dynamic> listaDeDados = json;

      _produtos = listaDeDados.map((item) => Produto.fromJson(item)).toList();
    } catch (e) {
      print(e);
    } finally {
      _carregando = false;
      notifyListeners();
    }
  }
}
