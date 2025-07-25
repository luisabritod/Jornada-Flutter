import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firebase_app/features/tarefas/tarefas.dart';

void mostrarDialogDeTarefa(BuildContext context) {
  final TextEditingController textEditingController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Adicionar nova tarefa'),
        content: TextField(
          controller: textEditingController,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Descrição da tarefa...'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (textEditingController.text.isNotEmpty) {
                Provider.of<TarefaProvider>(
                  context,
                  listen: false,
                ).adicionarTarefa(textEditingController.text);
                Navigator.of(context).pop();
              }
            },
            child: Text('Adicionar'),
          ),
        ],
      );
    },
  );
}
