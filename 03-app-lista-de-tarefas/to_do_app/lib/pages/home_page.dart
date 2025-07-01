import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha lista de tarefas'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Minhas tarefas vão aparecer aqui')),
    );
  }
}
