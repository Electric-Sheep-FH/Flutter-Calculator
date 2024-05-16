import 'package:flutter/material.dart';
import 'package:calculator/calculator_function.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 27, 202, 88)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 134, 97, 69)
      ),
      home: const Calculator(title: 'Calculator'),
    );
  }
}