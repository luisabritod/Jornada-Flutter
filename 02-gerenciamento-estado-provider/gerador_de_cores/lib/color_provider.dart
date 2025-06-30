import 'dart:math';

import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _corAtual = Colors.grey;

  Color get corAtual => _corAtual;

  void gerarNovaCor() {
    _corAtual = Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1,
    );
  }
}
