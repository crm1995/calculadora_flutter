import 'package:flutter/material.dart';
import 'botao.dart';

class LinhaBotoes extends StatelessWidget {
  final List<Botao> botoes; //lista de botões

  LinhaBotoes(this.botoes); //Construtor

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1, //ocupa apenas 1 espaço
      child: Row(
        //estica os botões ocupando todo o espaço
        crossAxisAlignment: CrossAxisAlignment.stretch,

        //.fold é uma função onde você reduz uma lista com vários elementos
        //em um único elemento a cada interação, para que seja possível
        //combinar o elemento atual com outro elemento.
        //Em outras linguagens é a função "Reduce"
        children: botoes.fold(
          <Widget>[], //recebe uma lista vazia e uma função para combinar
          (lista, botao) {
            //essa função será chamada para cada elemento da lista
            lista.isEmpty //se a lista for vazia (1ª iteração)
                ? lista.add(botao) //adiciona o botão
                : lista.addAll([SizedBox(width: 1), botao]); //add SizedBox + Bt
            return lista;
          },
        ),
      ),
    );
  }
}
