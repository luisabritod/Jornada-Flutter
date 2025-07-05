import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitrine_app/providers/produto_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // usamos o initState para que os produtos sejam buscados assim que a tela é criada
    Provider.of<ProdutoProvider>(context, listen: false).buscarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
