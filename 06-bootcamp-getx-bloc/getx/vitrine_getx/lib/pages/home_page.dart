import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitrine_getx/controllers/controllers.dart';
import 'package:vitrine_getx/services/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final VitrineService service = Get.put(VitrineService());
    final VitrineController controller = Get.put(VitrineController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Vitrine em GetX'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Obx(() {
            if (controller.carregando.value) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: controller.produtos.length,
                itemBuilder: (context, index) {
                  final produto = controller.produtos[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.network(
                          produto.image,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                produto.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'R\$: ${produto.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.green[700],
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
