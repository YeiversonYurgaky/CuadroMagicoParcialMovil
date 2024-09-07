import 'package:cuadomagico/cuadradoMagicoLogica.dart';
import 'package:flutter/material.dart';

class CuadroMagico extends StatelessWidget {
  const CuadroMagico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuadro Mágico"),
        titleTextStyle: const TextStyle(
            color: Colors.brown, fontSize: 32, fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: CuadradomMagicoLogica(),
    );
  }
}
