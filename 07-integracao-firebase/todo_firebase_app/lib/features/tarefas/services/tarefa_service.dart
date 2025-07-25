import 'package:cloud_firestore/cloud_firestore.dart';

class TarefaService {
  // 1. criamos uma referência para a "coleção de tarefas Firestore.
  // pense nisso como o "endereço" da nossa gaveta de tarefas na nuvem.
  // se a coleção 'tarefas' não existir, o Firebase a cria.
  final CollectionReference _tarefasCollection = FirebaseFirestore.instance
      .collection('tarefas');

  // os métodos para criar, ler, atualizar e deletar (CRUD) virão aqui

  // --- MÉTODO PARA LER AS TAREFAS (READ) ---
  // esse método é especial: ele retorna um "cano" (Stream) de dados
  // toda vez que algo mudar na coleção 'tarefas' no Firebase, a informação nova descerá por esse cano automaticamente e em tempo real
  Stream<QuerySnapshot> getTarefaStream() {
    // .snapshot() nos dá esse "cano" em tempo real da nossa coleção
    return _tarefasCollection.snapshots();
  }

  // --- MÉTODO PARA ADICIONAR UMA TAREFA (CREATE) ---
  // esse método será chamado quando o usuário digitar uma nova tarefa
  Future<void> adicionarTarefa(String titulo) {
    // o Firestore espera um Map, exatamente como esta no método toFirestore() na classe Tarefa
    // usamos .add() e o Firebase cuida de criar o documentos com ID único
    return _tarefasCollection.add({
      'titulo': titulo,
      'concluida': false,
      'timestamp':
          FieldValue.serverTimestamp(), // boa prática: salva a data de criação
    });
  }

  // --- MÉTODO PARA ATUALIZAR UMA TAREFA (UPDATE) ---
  Future<void> atualizarStatusTarefa(String id, bool statusAtual) {
    return _tarefasCollection.doc(id).update({'concluida': !statusAtual});
  }

  // --- MÉTODO PARA DELETAR UMA TAREFA (DELETE) ---
  Future<void> deletarTarefa(String id) {
    // o método .doc(id) encontra o documento específico
    // o .delete() o remove
    return _tarefasCollection.doc(id).delete();
  }
}
