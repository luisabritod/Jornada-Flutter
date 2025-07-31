import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_getx_firebase/features/carrinho/controllers/carrinho_controller.dart';
import 'package:loja_getx_firebase/features/carrinho/services/carrinho_service.dart';
import 'package:loja_getx_firebase/features/carrinho/view/carrinho_page.dart';
import 'package:loja_getx_firebase/features/produtos/controllers/produto_controller.dart';
import 'package:loja_getx_firebase/features/produtos/services/produto_service.dart';

class ProdutoPage extends StatelessWidget {
  const ProdutoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProdutoService produtoService = Get.put(ProdutoService());
    final ProdutoController produtoController = Get.put(ProdutoController());
    final CarrinhoService carrinhoService = Get.put(CarrinhoService());
    final CarrinhoController carrinhoController = Get.put(CarrinhoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CarrinhoPage());
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Obx(() {
        if (produtoController.carregando.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            final produto = produtoController.produtos[index];

            return Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.network(produto.image, height: 100),
                    SizedBox(height: 10),
                    Text(produto.title, textAlign: TextAlign.center),
                    SizedBox(height: 10),
                    Text(
                      'R\$ ${produto.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        carrinhoController.adicionarItem(produto);
                      },
                      child: Text('Adicionar ao carrinho'),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: produtoController.produtos.length,
        );
      }),
    );
  }
}
