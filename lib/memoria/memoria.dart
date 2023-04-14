class Memoria {
  //Lista com todas operações possíveis
  static const operacoes = const ['%', '<-', '/', 'x', '-', '+', '='];
  String _valor = '0';
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _operacao = '';
  bool _limparValor = false;

  //Get
  String get valor {
    return _valor;
  }

  //Set
  void aplicarComando(String comando) {
    if (comando == 'AC') {
      _limparTudo();
    } else if (comando == '<-') {
      _apagaDigito();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _addDigito(comando);
    }
  }

  //Retorna o valor entre o primeiro indice e o último
  _apagaDigito() {
    _valor = _valor.substring(0, _valor.length - 1);
  }

  _setOperacao(String novaOperacao) {
    bool seIgual = novaOperacao == '=';

    if (_bufferIndex == 0) {
      //Se não for operação de = (evita que seja calculado 'valor = valor')
      if (!seIgual) {
        _operacao = novaOperacao;
        _bufferIndex = 1;
      }
    } else {
      _buffer[0] = _calcularOperacao();
      _buffer[1] = 0.0;
      _valor = _buffer[0].toString();
      //Se o valor termina com .0 ele pega a primeira parte, senão mantem o valor
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;

      _operacao = seIgual ? '' : novaOperacao; //se for '=' zera, senão armazena
      _bufferIndex = seIgual ? 0 : 1; //Se for '=' zera o index, senão muda p/ 1
    }

    _limparValor = true;
  }

  //Se for selecionado uma operação será limpado o valor anterior e será mostrado o próximo valor digitado
  //A cada operação é zerado o valor atual e exibido somente o novo valor digitado
  //Também retira o 0 à esquerda
  _addDigito(String digito) {
    final ponto = digito == ',';
    final limparValor = (_valor == '0' && !ponto) || _limparValor;
    final valorVazio = ponto ? '0' : '';
    final valorAtual = limparValor ? valorVazio : _valor;

    _valor = valorAtual + digito;
    _limparValor = false;

    //Converte o valor para double e armazena no buffer, caso não consiga coloca o 0 como padrão
    _buffer[_bufferIndex] = double.tryParse(_valor) ?? 0;

    print(_buffer); //################################################## /
  }

  //"All Clear", zera calculadora
  void _limparTudo() {
    _valor = '0';
    _buffer[0] = 0.0;
    _buffer[1] = 0.0;
    _operacao = '';
    _bufferIndex = 0;
    _limparValor = false;
  }

  //Calcula as operações
  _calcularOperacao() {
    switch (_operacao) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }
}
