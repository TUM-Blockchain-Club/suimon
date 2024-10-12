import 'package:flutter/material.dart';

void main() {
  runApp(const Suimon());
}

class Suimon extends StatelessWidget {
  const Suimon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suimon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Welcome to Suimon'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
