class Tarefa {
  final String id;
  final String titulo;
  bool isDone;

  Tarefa({required this.titulo, this.isDone = false})
    : id = DateTime.now().toIso8601String();
}
