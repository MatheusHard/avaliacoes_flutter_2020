

class Avaliacao {


  DateTime _dataHora;

   DateTime get dataHora => _dataHora;
   int _idAv = 0;
   int _idCidade;

  /**********************Conteudo Teórico*******************************/

   int _radioSim_1, _radioNao_1;

  /**********************Conteudo Prático*******************************/

   int _radioMuito_2, _radiobom_2, _radioRegular_2, _radioRuim_2;
   int _radioSeguro_3, _radioPoucoSeguro_3, _radioInseguro_3;
   int _radioExcessiva_4, _radioRazoavel_4, _radioInsuficiente_4;

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

   /*********Construtor*********/

  Avaliacao(this._dataHora,this._idCidade, this._radioSim_1, this._radioNao_1,
            this._radioMuito_2, this._radiobom_2, this._radioRegular_2, this._radioRuim_2,
            this._radioSeguro_3, this._radioPoucoSeguro_3, this._radioInseguro_3,
            this._radioExcessiva_4, this._radioRazoavel_4, this._radioInsuficiente_4,
            this._radioMuito_5,  this._radiobom_5, this._radioRegular_5, this._radioRuim_5,
            this._radioMuito_6,  this._radiobom_6, this._radioRegular_6, this._radioRuim_6,
            this._radioMuito_7,  this._radiobom_7, this._radioRegular_7, this._radioRuim_7,
            this._radioMuito_8,  this._radiobom_8, this._radioRegular_8, this._radioRuim_8,
            this._radioMuito_9,  this._radiobom_9, this._radioRegular_9, this._radioRuim_9,
            this._radioMuito_10,this._radiobom_10,this._radioRegular_10,this._radioRuim_10,
            this._sugestoes,this._tipoAgente,this._nomeTipoAgente,this._nomeAgente,this._cpf);

  Map<String, dynamic> toJson() =>
      {
        'radioSim_1': this._radioSim_1.toString(),
        'radioNao_1': this._radioNao_1.toString(),
        'radioMuito_2': this._radioMuito_2.toString(),
        'radiobom_2': this._radiobom_2.toString(),
        'radioRegular_2': this._radioRegular_2.toString(),
        'radioRuim_2': this._radioRuim_2.toString(),
        'radioSeguro_3': this._radioSeguro_3.toString(),
        'radioPoucoSeguro_3': this._radioPoucoSeguro_3.toString(),
        'radioInseguro_3': this._radioInseguro_3.toString(),
        'radioExcessiva_4': this.radioExcessiva_4.toString(),
        'radioRazoavel_4': this.radioRazoavel_4.toString(),
        'radioInsuficiente_4': this.radioInsuficiente_4.toString(),
        'radioMuito_5' :this.radioMuito_5.toString(),
        'radiobom_5': this.radiobom_5.toString(),
        'radioRegular_5': this.radioRegular_5.toString(),
        'radioRuim_5': this.radioRuim_5.toString(),
        'radioMuito_6': this.radioMuito_6.toString(),
        'radiobom_6': this.radiobom_6.toString(),
        'radioRegular_6': this.radioRegular_6.toString(),
        'radioRuim_6': this.radioRuim_6.toString(),
        'radioMuito_7': this.radioMuito_7.toString(),
        'radiobom_7': this.radiobom_7.toString(),
        'radioRegular_7': this.radioRegular_7.toString(),
        'radioRuim_7': this.radioRuim_7.toString(),
        'radioMuito_8': this.radioMuito_8.toString(),
        'radiobom_8': this.radiobom_8.toString(),
        'radioRegular_8': this.radioRegular_8.toString(),
        'radioRuim_8': this.radioRuim_8.toString(),
        'radioMuito_9': this.radioMuito_9.toString(),
        'radiobom_9': this.radiobom_9.toString(),
        'radioRegular_9': this.radioRegular_9.toString(),
        'radioRuim_9': this.radioRuim_9.toString(),
        'radioMuito_10': this.radioMuito_10.toString(),
        'radiobom_10': this.radiobom_10.toString(),
        'radioRegular_10': this.radioRegular_10.toString(),
        'radioRuim_10': this.radioRuim_10.toString(),
        'descricao': this._sugestoes.toString(),
        'cidade_id': this.idCidade.toString(),
        'descricao_profissional': this.nomeAgente.toString(),
        'descricao_tipo_profissional': this.nomeTipoAgente.toString(),
        'tipo_profissional': this._tipoAgente.toString(),
        'datahora': this.dataHora.toString(),
        'cpf_profissional': this._cpf.toString(),
      };

   int get idAv => _idAv;

   int get idCidade => _idCidade;

   int get radioSim_1 => _radioSim_1;

  get radioNao_1 => _radioNao_1;

   int get radioMuito_2 => _radioMuito_2;

  get radiobom_2 => _radiobom_2;

  get radioRegular_2 => _radioRegular_2;

  get radioRuim_2 => _radioRuim_2;

   int get radioSeguro_3 => _radioSeguro_3;

  get radioPoucoSeguro_3 => _radioPoucoSeguro_3;

  get radioInseguro_3 => _radioInseguro_3;

   int get radioExcessiva_4 => _radioExcessiva_4;

  get radioRazoavel_4 => _radioRazoavel_4;

  get radioInsuficiente_4 => _radioInsuficiente_4;

   int get radioMuito_5 => _radioMuito_5;

  get radiobom_5 => _radiobom_5;

  get radioRegular_5 => _radioRegular_5;

  get radioRuim_5 => _radioRuim_5;

   int get radioMuito_6 => _radioMuito_6;

  get radiobom_6 => _radiobom_6;

  get radioRegular_6 => _radioRegular_6;

  get radioRuim_6 => _radioRuim_6;

   int get radioMuito_7 => _radioMuito_7;

  get radiobom_7 => _radiobom_7;

  get radioRegular_7 => _radioRegular_7;

  get radioRuim_7 => _radioRuim_7;

   int get radioMuito_8 => _radioMuito_8;

  get radiobom_8 => _radiobom_8;

  get radioRegular_8 => _radioRegular_8;

  get radioRuim_8 => _radioRuim_8;

   int get radioMuito_9 => _radioMuito_9;

  get radiobom_9 => _radiobom_9;

  get radioRegular_9 => _radioRegular_9;

  get radioRuim_9 => _radioRuim_9;

   int get radioMuito_10 => _radioMuito_10;

  get radiobom_10 => _radiobom_10;

  get radioRegular_10 => _radioRegular_10;

  get radioRuim_10 => _radioRuim_10;

   String get sugestoes => _sugestoes;

   int get tipoAgente => _tipoAgente;

   String get nomeTipoAgente => _nomeTipoAgente;

   String get nomeAgente => _nomeAgente;

   String get cpf => _cpf;



/******************************Geters and Seters******************************/


}