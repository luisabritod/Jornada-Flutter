import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas_app/pages/pages.dart';
import 'package:receitas_app/providers/providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<ReceitasProvider>(context, listen: false).buscarReceitas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Receitas")),
      body: Center(
        child: Consumer<ReceitasProvider>(
          builder: (context, receitas, _) {
            if (receitas.carregando) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final receita = receitas.receitas[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(receitaId: receita.id),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Image.network(receita.urlImagem),
                          SizedBox(height: 10),
                          Text(
                            receita.nome,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: receitas.receitas.length,
              );
            }
          },
        ),
      ),
    );
  }
}
