import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:receitas_app/models/models.dart';
import 'package:http/http.dart' as http;

class ReceitasProvider extends ChangeNotifier {
  List<ReceitaResumo> _receitas = [];
  bool _carregando = false;
  ReceitaDetalhada? _receitaDetalhada;

  List<ReceitaResumo> get receitas => _receitas;
  bool get carregando => _carregando;
  ReceitaDetalhada? get receitaDetalhada => _receitaDetalhada;

  void buscarReceitas() async {
    _carregando = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert",
        ),
      );

      final json = jsonDecode(response.body);

      final List<dynamic> listaDeReceitas = json["meals"];

      _receitas = listaDeReceitas
          .map((item) => ReceitaResumo.fromJson(item))
          .toList();
    } catch (e) {
      print(e);
    } finally {
      _carregando = false;
      notifyListeners();
    }
  }

  void buscarDetalhesDaReceita(String id) async {
    _carregando = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id"),
      );

      final json = jsonDecode(response.body);

      if (json["meals"] != null) {
        final Map<String, dynamic> dadosDaReceita = json["meals"][0];

        _receitaDetalhada = ReceitaDetalhada.fromJson(dadosDaReceita);
      }
    } catch (e) {
      print(e);
    } finally {
      _carregando = false;
      notifyListeners();
    }
  }
}
