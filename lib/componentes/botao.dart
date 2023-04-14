import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  //Cores para os tipos de botões
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERACAO = Color.fromRGBO(250, 158, 13, 1);

  final String texto;
  final bool grande;
  final Color cor;

  //Essa função retorna o texto do botão que foi clicado
  final void Function(String) valorBotao;

  //Construtor padrão
  Botao({
    required this.texto,
    this.grande = false,
    this.cor = DEFAULT,
    required this.valorBotao,
  });

  //Construtor para botão grande
  Botao.grande({
    required this.texto,
    this.grande = true,
    this.cor = DEFAULT,
    required this.valorBotao,
  });

  //Construtor para botão de operação
  Botao.operacao({
    required this.texto,
    this.grande = false,
    this.cor = OPERACAO,
    required this.valorBotao,
  });

  //Construtor para botão escuro
  Botao.escuro({
    required this.texto,
    this.grande = false,
    this.cor = DARK,
    required this.valorBotao,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //Expande os botões ocupando o container todo
      flex: grande ? 2 : 1, //se for duplo flex 2, senão flex 1
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: this.cor,
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200, //peso da fonte
          ),
        ),

        //Quando pressionado o botão ele pega o valor e passa
        onPressed: () => valorBotao(texto),
      ),
    );
  }
}
