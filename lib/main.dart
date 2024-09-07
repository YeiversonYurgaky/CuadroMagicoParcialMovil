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
          useMaterial3: true, // Activar Material 3
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.brown, // Colores principales derivados de brown
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
              backgroundColor: Colors.brown[100], // Color de los botones
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.brown[100], // Fondo del AppBar
            centerTitle: true,
          ),
        ),
        home: const CuadroMagico());
  }
}
