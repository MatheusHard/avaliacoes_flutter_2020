
class Profissional{

  int _id;
  String _descricao_profisssao;

  Profissional(this._descricao_profisssao);

  Profissional.map(dynamic obj){

    this._descricao_profisssao = obj['descricao_profisssao'];
    this._id = obj['id'];
  }

  String get descricao_profisssao => _descricao_profisssao;
  int get id => _id;

  Map<String, dynamic> toMap() {

    var mapa = new Map<String, dynamic>();
    mapa["descricao_profisssao"] = _descricao_profisssao;
    if(id != null){mapa["id"] = _id;}

    return mapa;
  }

  Profissional.fromMap(Map<String, dynamic> mapa){

    this._descricao_profisssao = mapa['descricao_profisssao'];
    this._id = mapa['id'];
  }
}