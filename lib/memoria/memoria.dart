class Memoria {
  //Lista com todas operações possíveis
  static const operacoes = const ['%', '<-', '/', 'x', '-', '+', '='];
  String _valor = '0'; //Valor padrão no display
  final _buffer = [0.0, 0.0]; //Valor padrão no buffer
  int _bufferIndex = 0; //Para saber com qual valor está trabalhando
  String _operacao = '';
  bool _limparValor = false;
  String _ultimoComando = '';

  //Get
  String get valor {
    return _valor;
  }

  //Set
  void aplicarComando(String comando) {
    //Se estiver substituindo uma operação por outra operação, retorna a nova
    if (_substituindoOperacao(comando)) {
      _operacao = comando; //Substitui a operação anterior pela nova
      return;
    }

    if (comando == 'AC') {
      _limparTudo(); //Limpa tudo
    } else if (comando == '<-') {
      _apagaDigito();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando); //Seleciona a operação
    } else {
      _addDigito(comando); //Concatena os números
    }

    _ultimoComando = comando;
  }

  //Retorna o valor entre o primeiro indice e o último
  _apagaDigito() {
    _valor = _valor.substring(0, _valor.length - 1);
  }

  _setOperacao(String novaOperacao) {
    bool seIgual = novaOperacao == '='; //armazena se novaOperação for '='

    if (_bufferIndex == 0) {
      //Se não for operação de = (evita que seja calculado 'valor = valor')
      if (!seIgual) {
        _operacao = novaOperacao; //Passa a operação
        _bufferIndex = 1; //Muda o index do buffer para colocar o novo valor
      }
    } else {
      //Se o index não for 0, calcula a operação
      _buffer[0] = _calcularOperacao(); //Coloca o resultado no indice 0
      _buffer[1] = 0.0; //Zera o indice 1 para ser usado posteriormente
      _valor = _buffer[0].toString(); //Passa o resultado para exibir no display
      //Se o valor termina com .0 ele pega a primeira parte, senão mantem o valor
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;

      _operacao = seIgual ? '' : novaOperacao; //se for '=' zera, senão armazena
      _bufferIndex = seIgual ? 0 : 1; //Se for '=' zera o index, senão muda p/ 1
    }

    _limparValor = true; //limpa o valor para exibir somente o próximo valor
  }

  //Se o _ultimoComando e o comando estiverem dentro de operacoes e
  //forem diferentes de igual retorna verdadeiro
  _substituindoOperacao(String comando) {
    return operacoes.contains(_ultimoComando) &&
        operacoes.contains(comando) &&
        _ultimoComando != '=' &&
        comando != '=';
  }

  //Se for selecionado uma operação será limpado o valor anterior e será mostrado o próximo valor digitado
  //A cada operação é zerado o valor atual e exibido somente o novo valor digitado
  //Também retira o 0 à esquerda
  _addDigito(String digito) {
    //Se o valor digitado for ponto coloca dentro da variável
    final ponto = digito == ',';

    //Se o valor for 0 e não for ponto ou for para limpar o valor
    final limparValor = (_valor == '0' && !ponto) || _limparValor;

    //Não deixa colocar mais de um ponto no mesmo valor.
    //A não ser que tenha uma operação depois do primeiro ponto
    if (ponto && _valor.contains(',') && !limparValor) {
      return;
    }

    //Se for ponto coloca 0, senão deixa vazio
    final valorVazio = ponto ? '0' : '';

    //Se o limparValor for verdadeiro coloca valor vazio, senão mantem o valor
    final valorAtual = limparValor ? valorVazio : _valor;

    //_valor é o que será mostrado no display
    _valor = valorAtual + digito;
    _limparValor = false;
    //Converte o valor para double e armazena no buffer, caso não consiga coloca o 0 como padrão
    _buffer[_bufferIndex] = double.tryParse(_valor) ?? 0;

    print(_buffer); //################################################## /
  }

  //"All Clear", zera calculadora
  void _limparTudo() {
    _valor = '0'; //"seta" o valor 0
    _buffer[0] = 0.0; //zera o indice 0 do buffer
    _buffer[1] = 0.0; //zera o indice 1 do buffer
    _operacao = ''; //zera a operacao
    _bufferIndex = 0; //para começar a usar o indice 0
    _limparValor = false; //para não limpar o próximo digito
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
