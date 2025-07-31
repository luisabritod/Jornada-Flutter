import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_getx_firebase/features/carrinho/controllers/carrinho_controller.dart';
import 'package:loja_getx_firebase/features/carrinho/services/carrinho_service.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CarrinhoService carrinhoService = Get.find<CarrinhoService>();
    final CarrinhoController carrinhoController =
        Get.find<CarrinhoController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Meu Carrinho')),
      body: Obx(() {
        if (carrinhoController.itens.isEmpty) {
          return Center(child: Text('Seu carrinho está vazio!'));
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            final item = carrinhoController.itens[index];

            return ListTile(
              leading: Image.network(item.image, width: 50),
              title: Text(item.title),
              subtitle: Text('Qtd: ${item.quantity}'),
              trailing: Text(
                'R\$ ${(item.price * item.quantity).toStringAsFixed(2)}',
              ),
            );
          },
          itemCount: carrinhoController.itens.length,
        );
      }),
    );
  }
}
