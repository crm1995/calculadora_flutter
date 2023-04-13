import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart'; //Dependência adicionada no pubspec.yaml

//Recebe o valor que será recebido no display
class Display extends StatelessWidget {
  final String texto;

  Display(this.texto); //Construtor

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //Para expandir na tela
      flex: 1, //Ocupa todo espaço disponível na tela
      child: Container(
        color: Color.fromRGBO(48, 48, 48, 1), //Cor de fundo do display
        child: Column(
          //Coloca o valor do texto na parte de baixo do container (Vertical)
          mainAxisAlignment: MainAxisAlignment.end,
          //Estica a coluna ocupando a tela toda (Horizontal)
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              //Espaçamento entre o texto e o display
              padding: const EdgeInsets.all(8.0), //para todos os lados
              //diminui o tamanho automaticamente
              child: AutoSizeText(
                texto,
                minFontSize: 20, //tamanho mínimo da fonte
                maxFontSize: 80, //tamanho máximo da fonte
                maxLines: 1, //no máximo 1 linha
                textAlign: TextAlign.end, //alinhar o texto no final
                style: TextStyle(
                  fontWeight: FontWeight.w100, //peso da fonte (fininha)
                  decoration: TextDecoration.none, //sem decoração
                  fontSize: 80, //tamanho
                  color: Colors.white, //cor da fonte
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
