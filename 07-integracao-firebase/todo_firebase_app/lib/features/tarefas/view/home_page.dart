import 'package:flutter/material.dart';
import 'package:todo_firebase_app/core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do com Firebase'),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
