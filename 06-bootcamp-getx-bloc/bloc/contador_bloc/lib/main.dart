import 'package:contador_bloc/core/core.dart';
import 'package:contador_bloc/features/contador/bloc/counter_bloc.dart';
import 'package:contador_bloc/features/contador/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // usamos BlocProvider para "disponibilizar" o Bloc para todos os widgets filhos
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Contador BLoC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: CounterPage(),
      ),
    );
  }
}
