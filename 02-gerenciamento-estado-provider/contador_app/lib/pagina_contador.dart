import 'package:contador_app/contador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaginaContador extends StatelessWidget {
  const PaginaContador({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Você apertou o botão este tanto de vezes: '),
            Consumer<ContadorProvider>(
              builder: (context, contador, _) {
                return Text(
                  '${contador.numero}',
                  // contador.numero.toString(),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<ContadorProvider>(
                context,
                listen: false,
              ).decrementar();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              Provider.of<ContadorProvider>(
                context,
                listen: false,
              ).incrementar();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
