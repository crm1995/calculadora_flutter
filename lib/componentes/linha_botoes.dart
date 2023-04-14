import 'package:flutter/material.dart';
import 'botao.dart';

class LinhaBotoes extends StatelessWidget {
  final List<Botao> botoes;

  LinhaBotoes(this.botoes);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1, //ocupa apenas 1 espaço
      child: Row(
          //estica os botões ocupando todo o espaço
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: botoes),
    );
  }
}
