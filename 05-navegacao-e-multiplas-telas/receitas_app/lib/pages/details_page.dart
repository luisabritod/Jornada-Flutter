import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas_app/providers/providers.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.receitaId});

  final String receitaId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<ReceitasProvider>(
      context,
      listen: false,
    ).buscarDetalhesDaReceita(widget.receitaId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da receita"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Consumer<ReceitasProvider>(
          builder: (context, provider, _) {
            if (provider.carregando) {
              return const CircularProgressIndicator();
            }
            if (provider.receitaDetalhada != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(provider.receitaDetalhada!.urlImagem),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        provider.receitaDetalhada!.nome,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ingredientes:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          // usamos .map para transformar cada string da lista em um widget Text
                          for (final ingrediente
                              in provider.receitaDetalhada!.ingredientes)
                            Text('• $ingrediente'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Modo de preparo:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(provider.receitaDetalhada!.instrucoes),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Text("Nenhuma receita encontrada.");
          },
        ),
      ),
    );
  }
}
