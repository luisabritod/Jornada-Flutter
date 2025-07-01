import 'package:flutter/material.dart';
import 'package:to_do_app/models/tarefa_model.dart';

class TarefaProvider extends ChangeNotifier {
  final List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  void criarTarefa(String titulo) {
    final novaTarefa = Tarefa(titulo: titulo);

    _tarefas.add(novaTarefa);

    notifyListeners();
  }
}
