import 'package:conselhos_getx/controllers/controllers.dart';
import 'package:conselhos_getx/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // o GetX é inteligente o suficiente para o controller encontrar o service
  final ConselhoService service = Get.put(ConselhoService());
  final ConselhoController controller = Get.put(ConselhoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conselhos com GetX 🔮'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Obx(() {
            // se estiver carregando mostra a bolinha
            if (controller.carregando.value) {
              return CircularProgressIndicator();
            }

            // se não tiver carregando e já tivermos um conselho
            if (controller.conselho.value != null) {
              return Text(
                '"${controller.conselho.value!.texto}"',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              );
            }

            // se não estiver fazendo nada (estado inicial)...
            return Text(
              'Clique no botão para receber um conselho!',
              style: TextStyle(fontSize: 18),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.buscarConselho,
        child: Icon(Icons.psychology_outlined),
      ),
    );
  }
}
