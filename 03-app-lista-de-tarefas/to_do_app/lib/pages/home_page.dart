import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/tarefa_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha lista de tarefas'),
        backgroundColor: Colors.purple[200],
        foregroundColor: Colors.white,
      ),
      body: Consumer<TarefaProvider>(
        builder: (context, tarefa, _) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  tarefa.tarefas[index].titulo,
                  style: TextStyle(color: Colors.purple[800], fontSize: 20),
                ),
                leading: Checkbox(
                  value: tarefa.tarefas[index].isDone,
                  onChanged: (value) {},
                ),
              );
            },
            itemCount: tarefa.tarefas.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogoDeTarefa(context);
        },
        backgroundColor: Colors.purple[200],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}

void _mostrarDialogoDeTarefa(BuildContext context) {
  final TextEditingController text = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Adicionar nova tarefa'),
        content: TextField(controller: text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (text.text.isNotEmpty) {
                Provider.of<TarefaProvider>(
                  context,
                  listen: false,
                ).criarTarefa(text.text);

                Navigator.pop(context);
              }
            },
            child: Text('Adicionar'),
          ),
        ],
      );
    },
  );
}
