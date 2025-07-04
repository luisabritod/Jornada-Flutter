import 'package:flutter/material.dart';
import 'package:gerador_de_conselhos/models/conselho_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConselhoProvider extends ChangeNotifier {
  ConselhoModel? _conselho;
  bool _carregando = false;

  ConselhoModel? get conselho => _conselho;
  bool get carregando => _carregando;

  Future<void> buscarNovoConselho() async {
    // avisa a UI que estamos começando a carregar
    _carregando = true;
    notifyListeners();

    try {
      // chama a API e espera a resposta
      final response = await http.get(
        Uri.parse('https://api.adviceslip.com/advice'),
      );

      // decodifica o texto de resposta (JSON) para um map
      final json = jsonDecode(response.body);

      // usa o construtor para transformar o map em um objeto ConselhoModel
      _conselho = ConselhoModel.fromJson(json);
    } catch (e) {
      print(e);
    } finally {
      // avisa a UI que terminou de carregar
      _carregando = false;
      notifyListeners();
    }
  }
}
