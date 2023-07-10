import 'package:app_livraria_flutter/pages/homepage.dart';
import 'package:app_livraria_flutter/themes/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Livraria Flutter',
      theme: myTheme,
      home: const HomePage(),
    );
  }
}
