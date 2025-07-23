class Tarefa {
  final String id; // esse ID o firebase gera automático
  final String titulo;
  final bool concluida;

  Tarefa({required this.id, required this.titulo, required this.concluida});

  // .fromFirestore sabe ler os dados que vêm do Firebase
  factory Tarefa.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Tarefa(
      id: documentId,
      titulo: data['titulo'] ?? '', // ?? para caso um dado venha nulo
      concluida: data['concluida'] ?? false,
    );
  }

  // toFirestore() sabe escrever os dados no formato que o Firebase entende
  Map<String, dynamic> toFirestore() {
    return {'titulo': titulo, 'concluida': concluida};
  }
}
