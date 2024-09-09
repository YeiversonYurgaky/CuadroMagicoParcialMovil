import 'package:flutter/material.dart';

class CuadradomMagicoLogica extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CuadradomMagicoLogica();
  }
}

class _CuadradomMagicoLogica extends State<CuadradomMagicoLogica> {
  List<TextEditingController> numeroerosDadosPorUsuario = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void mostrarAlerta(String mensaje, String titulo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensaje),
          actions: [
            TextButton(
              child: Text("Continuar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void validarQueSeCumplaElCuadroMagico() {
    int numero1 = int.tryParse(numeroerosDadosPorUsuario[0].text) ?? 0;
    int numero2 = int.tryParse(numeroerosDadosPorUsuario[1].text) ?? 0;
    int numero3 = int.tryParse(numeroerosDadosPorUsuario[2].text) ?? 0;
    int numero4 = int.tryParse(numeroerosDadosPorUsuario[3].text) ?? 0;
    int numero5 = int.tryParse(numeroerosDadosPorUsuario[4].text) ?? 0;
    int numero6 = int.tryParse(numeroerosDadosPorUsuario[5].text) ?? 0;
    int numero7 = int.tryParse(numeroerosDadosPorUsuario[6].text) ?? 0;
    int numero8 = int.tryParse(numeroerosDadosPorUsuario[7].text) ?? 0;
    int numero9 = int.tryParse(numeroerosDadosPorUsuario[8].text) ?? 0;

    Set<int> verificarNumerosSeanUnicos = {
      numero1,
      numero2,
      numero3,
      numero4,
      numero5,
      numero6,
      numero7,
      numero8,
      numero9
    };

    if (verificarNumerosSeanUnicos.length != 9 ||
        verificarNumerosSeanUnicos.any((n) => n < 1 || n > 9)) {
      mostrarAlerta(
          'Los números deben ser únicos y estar entre 1 y 9', 'Error');
      return;
    }

    int sumaNecesaria = numero1 + numero2 + numero3;
    bool seCumpleCuadroMagico = (numero4 + numero5 + numero6 == sumaNecesaria) &&
        (numero7 + numero8 + numero9 == sumaNecesaria) &&
        (numero1 + numero4 + numero7 == sumaNecesaria) &&
        (numero2 + numero5 + numero8 == sumaNecesaria) &&
        (numero3 + numero6 + numero9 == sumaNecesaria) &&
        (numero1 + numero5 + numero9 == sumaNecesaria) &&
        (numero3 + numero5 + numero7 == sumaNecesaria);

    if (seCumpleCuadroMagico) {
      mostrarAlerta(
          '¡Felicidades, has logrado completar el cuadro mágico!', 'Victoria');
    } else {
      mostrarAlerta('No es un cuadro mágico.', 'Sigue intentando');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.brown[100],
                        border: Border.all(
                          color: Colors.brown[800]!,
                          width: 4,
                        ),
                      ),
                      child: TextField(
                        controller: numeroerosDadosPorUsuario[index],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: validarQueSeCumplaElCuadroMagico,
              child: Text("Validar Cuadro Mágico"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
