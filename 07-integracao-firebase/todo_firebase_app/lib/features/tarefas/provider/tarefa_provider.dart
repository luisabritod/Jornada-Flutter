import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_firebase_app/features/tarefas/tarefas.dart';

class TarefaProvider extends ChangeNotifier {
  final TarefaService _service = TarefaService();

  // uma variável para guardar nossa "inscrição" no cano de dados
  StreamSubscription? _tarefasSubscription;

  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  // o CONSTRUTOR é chamado assim que o Provider for criado
  TarefaProvider() {
    _ouvirMudancasDasTarefas();
  }

  // o método que liga a "mangueira no cano"
  void _ouvirMudancasDasTarefas() {
    // começamos a ouvir o "cano" de dados do service
    _tarefasSubscription = _service.getTarefaStream().listen((snapshot) {
      // quando um novo 'pacote'de dados (snapshot) chega pelo cano
      // 1. transformamos a lista de 'documentos'do Firebase em uma List<Tarefa>
      // 2. usamos o .map para passar por cada documento ('doc')
      _tarefas = snapshot.docs.map((doc) {
        // 3. pegamos os dados do documento como map
        final data = doc.data() as Map<String, dynamic>;
        // 4. usamos nossa fábrica para criar o objeto Tarefa
        return Tarefa.fromFirestore(data, doc.id);
      }).toList();

      // 5.avisamos a UI que a lista de tarefas foi atualizada
      notifyListeners();
    });
  }

  Future<void> adicionarTarefa(String titulo) {
    return _service.adicionarTarefa(titulo);
  }

  Future<void> toggleEstadoTarefa(String id, bool statusAtual) {
    return _service.atualizarStatusTarefa(id, statusAtual);
  }

  @override
  void dispose() {
    // quando o Provider for "desligado", a gente "fecha a torneira" do cano para não gastar recurso atoa
    _tarefasSubscription?.cancel();
    super.dispose();
  }
}
