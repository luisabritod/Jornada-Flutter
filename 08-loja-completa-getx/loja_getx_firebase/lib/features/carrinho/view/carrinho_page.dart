import 'package:flutter/material.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Carrinho')),
      body: const Center(
        child: Text('Os itens do seu carrinho aparecerão aqui!'),
      ),
    );
  }
}
