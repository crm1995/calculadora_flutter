import 'package:calculadora/memoria/memoria.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../componentes/display.dart';
import '../componentes/teclado.dart';

//StatefulWidget significa que agora pode ter um estado
class Calculadora extends StatefulWidget {
  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  //Instancia a memória no estado da calculadora
  final Memoria memoria = Memoria();

  //Quando pressionar o botão ele passa o valor do botão para o estado
  //que "seta" na memória
  _quandoPressionado(String comando) {
    setState(() {
      memoria.aplicarComando(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Mantem a visualização da calculadora estática, mesmo em outra orientação
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      home: Column(
        children: [
          Display(memoria.valor), //Componente onde aparecerá o display
          Teclado(_quandoPressionado), //Componente onde aparecerá o teclado
        ],
      ),
    );
  }
}
