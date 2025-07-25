import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firebase_app/core/core.dart';
import 'package:todo_firebase_app/features/tarefas/tarefas.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do com Firebase'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
      ),
      body: Consumer<TarefaProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              if (provider.tarefas.isEmpty) {
                return Center(
                  child: Text('Nenhuma tarefa ainda. Adicione uma!'),
                );
              }

              return ListTile(
                title: Text(provider.tarefas[index].titulo),
                leading: Checkbox(
                  value: provider.tarefas[index].concluida,
                  onChanged: (show) {},
                ),
              );
            },
            itemCount: provider.tarefas.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => mostrarDialogDeTarefa(context),
        backgroundColor: AppColors.accent,
        child: Icon(Icons.add, color: AppColors.background),
      ),
    );
  }
}
