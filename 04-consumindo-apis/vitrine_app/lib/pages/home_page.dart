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
    return Scaffold(
      appBar: AppBar(title: Text('Vitrine')),
      body: Center(
        child: Consumer<ProdutoProvider>(
          builder: (context, produtosProvider, _) {
            if (produtosProvider.carregando) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final produto = produtosProvider.produtos[index];
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                itemCount: produtosProvider.produtos.length,
              );
            }
          },
        ),
      ),
    );
  }
}
