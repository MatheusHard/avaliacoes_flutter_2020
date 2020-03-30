

class Avaliacao {

   DateTime _dataHora;
   int _idAv = 0;
   int _idCidade;

  /**********************Conteudo Teórico*******************************/

   int _radioSim_1, _radioNao_1;

  /**********************Conteudo Prático*******************************/

   int _radioMuito_2, _radiobom_2, _radioRegular_2, _radioRuim_2;
   int _radioSeguro_3, _radioPoucoSeguro_3, _radioInseguro_3;
   int _radioExcessiva_4, _radioRazoavel_4, _RadioInsuficiente_4;

  /*****************************Instrutor*******************************/

   int _radioMuito_5, _radiobom_5, _radioRegular_5, _radioRuim_5;
   int _radioMuito_6, _radiobom_6, _radioRegular_6, _radioRuim_6;
   int _radioMuito_7, _radiobom_7, _radioRegular_7, _radioRuim_7;

  /***************************Equipe de Apoio***************************/

   int _radioMuito_8, _radiobom_8, _radioRegular_8, _radioRuim_8;
   int _radioMuito_9, _radiobom_9, _radioRegular_9, _radioRuim_9;
   int _radioMuito_10, _radiobom_10, _radioRegular_10, _radioRuim_10;

  /******************************Sugestões******************************/

   String _sugestoes;

  /******************************DADOS DO PROFISSIONAL******************************/

   int _tipoAgente;
   String _nomeTipoAgente = "";
   String _nomeAgente = "";
   String _cpf;

/******************************Geters and Seters******************************/

   DateTime get dataHora => _dataHora;

   set dataHora(DateTime dataHora) {
     _dataHora = dataHora;
   }

   int get idAv => _idAv;

   set idAv(int value) {
     _idAv = value;
   }

   int get idCidade => _idCidade;

  set idCidade(int value) {
    _idCidade = value;
  }

   int get radioSim_1 => _radioSim_1;

  set radioSim_1(int value) {
    _radioSim_1 = value;
  }

  get radioNao_1 => _radioNao_1;

  set radioNao_1(value) {
    _radioNao_1 = value;
  }

   int get radioMuito_2 => _radioMuito_2;

  set radioMuito_2(int value) {
    _radioMuito_2 = value;
  }

  get radiobom_2 => _radiobom_2;

  set radiobom_2(value) {
    _radiobom_2 = value;
  }

  get radioRegular_2 => _radioRegular_2;

  set radioRegular_2(value) {
    _radioRegular_2 = value;
  }

  get radioRuim_2 => _radioRuim_2;

  set radioRuim_2(value) {
    _radioRuim_2 = value;
  }

   int get radioSeguro_3 => _radioSeguro_3;

  set radioSeguro_3(int value) {
    _radioSeguro_3 = value;
  }

  get radioPoucoSeguro_3 => _radioPoucoSeguro_3;

  set radioPoucoSeguro_3(value) {
    _radioPoucoSeguro_3 = value;
  }

  get radioInseguro_3 => _radioInseguro_3;

  set radioInseguro_3(value) {
    _radioInseguro_3 = value;
  }

   int get radioExcessiva_4 => _radioExcessiva_4;

  set radioExcessiva_4(int value) {
    _radioExcessiva_4 = value;
  }

  get radioRazoavel_4 => _radioRazoavel_4;

  set radioRazoavel_4(value) {
    _radioRazoavel_4 = value;
  }

  get RadioInsuficiente_4 => _RadioInsuficiente_4;

  set RadioInsuficiente_4(value) {
    _RadioInsuficiente_4 = value;
  }

   int get radioMuito_5 => _radioMuito_5;

  set radioMuito_5(int value) {
    _radioMuito_5 = value;
  }

  get radiobom_5 => _radiobom_5;

  set radiobom_5(value) {
    _radiobom_5 = value;
  }

  get radioRegular_5 => _radioRegular_5;

  set radioRegular_5(value) {
    _radioRegular_5 = value;
  }

  get radioRuim_5 => _radioRuim_5;

  set radioRuim_5(value) {
    _radioRuim_5 = value;
  }

   int get radioMuito_6 => _radioMuito_6;

  set radioMuito_6(int value) {
    _radioMuito_6 = value;
  }

  get radiobom_6 => _radiobom_6;

  set radiobom_6(value) {
    _radiobom_6 = value;
  }

  get radioRegular_6 => _radioRegular_6;

  set radioRegular_6(value) {
    _radioRegular_6 = value;
  }

  get radioRuim_6 => _radioRuim_6;

  set radioRuim_6(value) {
    _radioRuim_6 = value;
  }

   int get radioMuito_7 => _radioMuito_7;

  set radioMuito_7(int value) {
    _radioMuito_7 = value;
  }

  get radiobom_7 => _radiobom_7;

  set radiobom_7(value) {
    _radiobom_7 = value;
  }

  get radioRegular_7 => _radioRegular_7;

  set radioRegular_7(value) {
    _radioRegular_7 = value;
  }

  get radioRuim_7 => _radioRuim_7;

  set radioRuim_7(value) {
    _radioRuim_7 = value;
  }

   int get radioMuito_8 => _radioMuito_8;

  set radioMuito_8(int value) {
    _radioMuito_8 = value;
  }

  get radiobom_8 => _radiobom_8;

  set radiobom_8(value) {
    _radiobom_8 = value;
  }

  get radioRegular_8 => _radioRegular_8;

  set radioRegular_8(value) {
    _radioRegular_8 = value;
  }

  get radioRuim_8 => _radioRuim_8;

  set radioRuim_8(value) {
    _radioRuim_8 = value;
  }

   int get radioMuito_9 => _radioMuito_9;

  set radioMuito_9(int value) {
    _radioMuito_9 = value;
  }

  get radiobom_9 => _radiobom_9;

  set radiobom_9(value) {
    _radiobom_9 = value;
  }

  get radioRegular_9 => _radioRegular_9;

  set radioRegular_9(value) {
    _radioRegular_9 = value;
  }

  get radioRuim_9 => _radioRuim_9;

  set radioRuim_9(value) {
    _radioRuim_9 = value;
  }

   int get radioMuito_10 => _radioMuito_10;

  set radioMuito_10(int value) {
    _radioMuito_10 = value;
  }

  get radiobom_10 => _radiobom_10;

  set radiobom_10(value) {
    _radiobom_10 = value;
  }

  get radioRegular_10 => _radioRegular_10;

  set radioRegular_10(value) {
    _radioRegular_10 = value;
  }

  get radioRuim_10 => _radioRuim_10;

  set radioRuim_10(value) {
    _radioRuim_10 = value;
  }

   String get sugestoes => _sugestoes;

  set sugestoes(String value) {
    _sugestoes = value;
  }

   int get tipoAgente => _tipoAgente;

  set tipoAgente(int value) {
    _tipoAgente = value;
  }

   String get nomeTipoAgente => _nomeTipoAgente;

  set nomeTipoAgente(String value) {
    _nomeTipoAgente = value;
  }

   String get nomeAgente => _nomeAgente;

  set nomeAgente(String value) {
    _nomeAgente = value;
  }

   String get cpf => _cpf;

  set cpf(String value) {
    _cpf = value;
  }
}