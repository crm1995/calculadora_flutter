import 'package:flutter/material.dart';
import 'botao.dart';
import 'linha_botoes.dart';

class Teclado extends StatelessWidget {
  final void Function(String) valorBotao;

  Teclado(this.valorBotao); //Construtor

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, //altura do teclado
      child: Column(
        children: [
          LinhaBotoes(
            [
              //lista de botões (Texto, retorna valor do botão)
              Botao.escuro(texto: 'AC', valorBotao: valorBotao),
              Botao.escuro(texto: '%', valorBotao: valorBotao),
              Botao.escuro(texto: '<-', valorBotao: valorBotao),
              Botao.operacao(texto: '/', valorBotao: valorBotao),
            ],
          ),
          LinhaBotoes(
            [
              //lista de botões (Texto, retorna valor do botão)
              Botao(texto: '7', valorBotao: valorBotao),
              Botao(texto: '8', valorBotao: valorBotao),
              Botao(texto: '9', valorBotao: valorBotao),
              Botao.operacao(texto: 'x', valorBotao: valorBotao),
            ],
          ),
          LinhaBotoes(
            [
              //lista de botões (Texto, retorna valor do botão)
              Botao(texto: '4', valorBotao: valorBotao),
              Botao(texto: '5', valorBotao: valorBotao),
              Botao(texto: '6', valorBotao: valorBotao),
              Botao.operacao(texto: '-', valorBotao: valorBotao),
            ],
          ),
          LinhaBotoes(
            [
              //lista de botões (Texto, retorna valor do botão)
              Botao(texto: '1', valorBotao: valorBotao),
              Botao(texto: '2', valorBotao: valorBotao),
              Botao(texto: '3', valorBotao: valorBotao),
              Botao.operacao(texto: '+', valorBotao: valorBotao),
            ],
          ),
          LinhaBotoes(
            [
              //lista de botões (Texto, retorna valor do botão)
              Botao.grande(texto: '0', valorBotao: valorBotao),
              Botao(texto: ',', valorBotao: valorBotao),
              Botao.operacao(texto: '=', valorBotao: valorBotao),
            ],
          ),
        ],
      ),
    );
  }
}
