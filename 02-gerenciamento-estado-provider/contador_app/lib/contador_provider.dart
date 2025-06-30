import 'package:flutter/material.dart';

class ContadorProvider extends ChangeNotifier {
  // o dado que ele guarda(privado, só ele pode mexer)
  int _numero = 0;

  // um jeito seguro para o resto do app ler o número
  int get numero => _numero;

  // o método que muda o dado
  void incrementar() {
    _numero++;

    // notifica o aplicativo
    notifyListeners();
  }

  void decrementar() {
    _numero--;

    notifyListeners();
  }

  void zerar() {
    _numero = 0;

    notifyListeners();
  }
}
