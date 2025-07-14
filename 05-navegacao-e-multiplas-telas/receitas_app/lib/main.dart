import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas_app/pages/pages.dart';
import 'package:receitas_app/providers/providers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ReceitasProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
