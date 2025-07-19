import 'package:contador_getx/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // aqui coloca nosso controller na memória e ele fica disponível para qualquer widget filho
  final ContadorController controller = ContadorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador GetX'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('O valor do contador é: ', style: TextStyle(fontSize: 24)),
            // o Obx envelopa o widget que precisa mudar e automaticamente escutas as variáveis .obs do controller
            Obx(() {
              return Text(
                // acessamos o valor da variável .obs com .value
                '${controller.contador.value}',
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.reset,
            child: Icon(Icons.refresh),
          ),
          SizedBox(width: 190),
          FloatingActionButton(
            onPressed: controller.decrementar,
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            // chamamos o método do nosso controller
            onPressed: controller.incrementar,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
