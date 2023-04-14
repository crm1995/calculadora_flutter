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
  final Memoria memoria = Memoria();

  _quandoPressionado(String comando) {
    setState(() {
      memoria.aplicarComando(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
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
