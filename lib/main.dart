import 'package:flutter/material.dart';
import 'package:atividade_api/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUSCA CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CepPage(),
    );
  }
}
