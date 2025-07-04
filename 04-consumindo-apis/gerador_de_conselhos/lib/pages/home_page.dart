import 'package:flutter/material.dart';
import 'package:gerador_de_conselhos/providers/conselho_provider.dart';
import 'package:provider/provider.dart';

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
      body: Center(
        child: Consumer<ConselhoProvider>(
          builder: (context, conselhoProvider, child) {
            // usa um if/else para decidir o que mostrar

            // se estiver carregando
            if (conselhoProvider.carregando) {
              return CircularProgressIndicator();
            }

            // se não tiver carregando e já tiver um conselho
            if (conselhoProvider.conselho != null) {
              return Text(
                '"${conselhoProvider.conselho!.texto}"',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              );
            }

            // se não estiver fazendo nada...
            return Text(
              'Clique no botão para receber um conselho!',
              style: TextStyle(fontSize: 18),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ConselhoProvider>(
            context,
            listen: false,
          ).buscarNovoConselho();
        },
        child: Icon(Icons.psychology_outlined),
      ),
    );
  }
}
