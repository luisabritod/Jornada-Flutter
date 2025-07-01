import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/provider/tarefa_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TarefaProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
