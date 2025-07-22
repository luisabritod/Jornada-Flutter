import 'package:conselhos_bloc/core/core.dart';
import 'package:conselhos_bloc/features/conselhos/bloc/conselho_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Conselhos com BLoC', style: AppTextStyles.appBarTitle),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: BlocBuilder<ConselhoBloc, ConselhoState>(
            builder: (context, state) {
              if (state is ConselhoLoading) {
                return CircularProgressIndicator();
              }

              if (state is ConselhoSucess) {
                return Text(
                  '"${state.conselho.texto}"',
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                );
              }

              if (state is ConselhoError) {
                return Text(
                  state.mensagem,
                  style: TextStyle(fontSize: 18, color: Colors.red),
                  textAlign: TextAlign.center,
                );
              }

              return Text(
                'Clique no botão para receber um conselho!',
                style: TextStyle(fontSize: 18),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ConselhoBloc>().add(NovoConselhoPedido());
        },
        child: Icon(Icons.psychology_outlined),
      ),
    );
  }
}
