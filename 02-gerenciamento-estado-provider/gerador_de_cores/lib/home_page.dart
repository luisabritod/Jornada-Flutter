// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gerador_de_cores/color_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (context, cor, _) {
        return Scaffold(
          appBar: AppBar(title: Text('Gerador de cores')),
          backgroundColor: cor.corAtual,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'RGB: ${cor.corAtual.red}, ${cor.corAtual.green}, ${cor.corAtual.blue}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 7.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<ColorProvider>(context, listen: false).gerarNovaCor();
            },
            child: Icon(Icons.change_circle),
          ),
        );
      },
    );
  }
}
