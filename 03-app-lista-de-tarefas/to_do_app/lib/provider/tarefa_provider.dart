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

  void toggleEstadoTarefa(String id) {
    // método firstWhere é usado para encontrar a tarefa correspondente na lista que tem o ID passado
    final tarefa = _tarefas.firstWhere((tarefa) => tarefa.id == id);

    tarefa.isDone = !tarefa.isDone;

    notifyListeners();
  }
}
