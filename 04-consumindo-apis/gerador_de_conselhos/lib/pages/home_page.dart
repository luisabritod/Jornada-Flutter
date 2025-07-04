import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerador de conselhos 🔮'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Clique no botão para receber um conselho!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.psychology_outlined),
      ),
    );
  }
}
