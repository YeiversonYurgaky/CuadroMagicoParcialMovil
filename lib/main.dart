import 'package:cuadomagico/cuadroMagico.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.brown,
          ),
          textTheme: TextTheme(
            headlineLarge: TextStyle(
                color: Colors.brown[900],
                fontSize: 32,
                fontWeight: FontWeight.bold),
            bodyMedium: const TextStyle(fontSize: 18),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[100],
              elevation: 8,
              
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.brown[100],
            centerTitle: true,
          ),
        ),
        home: const CuadroMagico());
  }
}
