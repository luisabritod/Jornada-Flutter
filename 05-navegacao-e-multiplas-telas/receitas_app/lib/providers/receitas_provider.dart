import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:receitas_app/models/models.dart';
import 'package:http/http.dart' as http;

class ReceitasProvider extends ChangeNotifier {
  List<ReceitaResumo> _receitas = [];
  bool _isDone = false;

  List<ReceitaResumo> get receitas => _receitas;
  bool get carregando => _isDone;

  void buscarReceitas() async {
    _isDone = true;
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
      _isDone = false;
      notifyListeners();
    }
  }
}
