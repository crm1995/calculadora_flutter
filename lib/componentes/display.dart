import 'package:flutter/material.dart';

//Recebe o valor que será recebido no display
class Display extends StatelessWidget {
  final String texto;

  Display(this.texto);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //Para expandir na tela
      flex: 1, //Ocupa todo espaço disponível na tela
      child: Container(
        color: Color.fromRGBO(48, 48, 48, 1),
        child: Column(
          //Coloca o valor do texto na parte de baixo do container (Vertical)
          mainAxisAlignment: MainAxisAlignment.end,
          //Estica a coluna ocupando a tela toda (Horizontal)
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Padding(
              //Espaçamento entre o texto e o display
              padding: const EdgeInsets.all(8.0), //para todos os lados
              child: Text(
                texto,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.w100, //peso da fonte (fininha)
                  decoration: TextDecoration.none,
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
