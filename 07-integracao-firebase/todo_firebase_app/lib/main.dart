import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase_app/features/to_do/to_do.dart';
import 'package:todo_firebase_app/firebase_options.dart';

// main() agora é async e retorna um Future<void>
Future<void> main() async {
  // garante que o flutter está pronto antes de rodar o app
  WidgetsFlutterBinding.ensureInitialized();

  //inicializa o firebase e espera(await) a conclusão
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //finalmente, roda o app aqui
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App Firebase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
