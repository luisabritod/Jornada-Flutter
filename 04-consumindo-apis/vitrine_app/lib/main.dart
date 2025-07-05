import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitrine_app/pages/home_page.dart';
import 'package:vitrine_app/providers/produto_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProdutoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
