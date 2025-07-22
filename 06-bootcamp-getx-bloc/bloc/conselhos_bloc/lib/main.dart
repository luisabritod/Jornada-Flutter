import 'package:conselhos_bloc/core/core.dart';
import 'package:conselhos_bloc/features/conselhos/bloc/conselho_bloc.dart';
import 'package:conselhos_bloc/features/conselhos/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConselhoBloc(),
      child: MaterialApp(
        title: 'Conselhos BLoC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
