

class Uf {

  int _id;
  String _descricao_uf;


  Uf(this._descricao_uf);

  Uf.map(dynamic obj){

    this._descricao_uf = obj['descricao_uf'];
    this._id = obj['id'];
  }

  String get descricao_uf => _descricao_uf;
  int get id => _id;

  Map<String, dynamic> toMap() {

    var mapa = new Map<String, dynamic>();
    mapa["descricao_uf"] = _descricao_uf;

    if(id != null){mapa["id"] = _id;}

    return mapa;
  }

  Uf.fromMap(Map<String, dynamic> mapa){

    this._descricao_uf = mapa['descricao_uf'];
    this._id = mapa['id'];
  }
}