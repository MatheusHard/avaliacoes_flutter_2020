

import 'dart:async';
import 'dart:io';


import 'package:avaliacao_json_novo/models/Cidade.dart';
import 'package:avaliacao_json_novo/models/Uf.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBAvaliacoes {

  static final DBAvaliacoes _instance = new DBAvaliacoes.internal();

  factory DBAvaliacoes() => _instance;

  /************TABELAS************/

  final String tabelaCidade = "tabelaCidade";
  final String tabelaUf = "tabelaUf";

  /*********ATRIBUTOS*********/

  final String colunaId = "id";
  final String colunaDescricao_cidade = "descricao_cidade";
  final String colunaUf_id = "uf_id";

  final String colunaIdUf = "id";
  final String colunaDescricao_Uf = "descricao_uf";




  static Database _db;

  Future <Database> get db async {
    if(_db != null){
      return _db;
    }
    _db = await initBD();
    return _db;
  }



  DBAvaliacoes.internal();

  initBD () async {
  Directory documentoDiretorio = await getApplicationDocumentsDirectory();
  String caminho = join(documentoDiretorio.path, "db_avaliacoes.db");// home://directory/files/db_avaliacoes.db

  var nossoDB = await  openDatabase(caminho, version: 1, onCreate: _onCreate);
  return nossoDB;
  }


  void _onCreate(Database db, int version) async {

    await db.execute("CREATE TABLE $tabelaCidade($colunaId INTEGER PRIMARY KEY,"
                      "$colunaDescricao_cidade TEXT,"
                      "$colunaUf_id INTEGER)");

    await db.execute("CREATE TABLE $tabelaUf($colunaIdUf INTEGER PRIMARY KEY,"
        "$colunaDescricao_Uf TEXT)");

  }

  /******************CRUD CIDADES******************/

  Future <int> inserirCidade (Cidade cidadeModel) async {
    print("Dentro do insert: "+ cidadeModel.descricao_cidade);
    var dbCidade = await db;
    int res = await dbCidade.insert("$tabelaCidade", cidadeModel.toMap());
    return res;
  }

  Future<List> getCidades () async {

    var dbCidade = await db;
    var res = await dbCidade.rawQuery("SELECT * FROM $tabelaCidade");
    return res.toList();
  }

  Future<List> getCidadesUfs() async {
// INNER JOIN $tabelaUf WHERE uf.id = cidade.cod_uf
    var dbCidadeUf = await db;
    var res = await dbCidadeUf.rawQuery("SELECT $tabelaCidade.$colunaId, $tabelaCidade.$colunaDescricao_cidade,"
                                      " $tabelaCidade.$colunaUf_id, $tabelaUf.$colunaDescricao_Uf  FROM $tabelaCidade"
                                      " INNER JOIN $tabelaUf WHERE $tabelaUf.$colunaIdUf = $tabelaCidade.$colunaUf_id"
                                      " ORDER BY $tabelaCidade.$colunaId != 1, $tabelaCidade.$colunaDescricao_cidade");
    return res.toList();
  }

  getCitys () async {

    var dbCidade = await db;
    String sql = "SELECT * FROM $tabelaCidade";
    List cidades = await dbCidade.rawQuery(sql);
    return cidades;
  }

  //Cont:
Future<int> contCidades () async {

  var dbCidade = await db;

  return Sqflite.firstIntValue(
      await dbCidade.rawQuery("SELECT COUNT(*) FROM $tabelaCidade")
  );

}
//PEgar Cidade pelo ID:
Future<Cidade> getCidade(int id) async{

  var dbCidade = await db;
  var res = await dbCidade.rawQuery("SELECT * FROM $tabelaCidade"
            "WHERE $colunaId = $id");
  if(res.length == 0) return null;
  return new Cidade.fromMap(res.first);
}


//Deletar:
  Future<int> apagarCidade (int id) async {
  var dbCidade = await db;
  return await dbCidade.delete(tabelaCidade,
                              where: "$colunaId = ?",
                              whereArgs: [id]);
}

//Deletar:
  Future<void> deletarTabelaCidade () async {
    var dbCidade = await db;
    return await dbCidade.rawDelete("DELETE FROM $tabelaCidade");

  }

//Atualizar:
  Future<int> atualizarCidade(Cidade cidadeModel) async{
  var dbCidade = await db;

  return await dbCidade.update(tabelaCidade,
                              cidadeModel.toMap(),
                              where: "$colunaId = ?",
                              whereArgs: [cidadeModel.id]);

}

  /******************CRUD UFS******************/

  Future <int> inserirUf (Uf uf) async {

    var dbUf = await db;
    int res = await dbUf.insert("$tabelaUf", uf.toMap());
    return res;
  }

  Future<List> getUfs () async {

    var dbUf = await db;
    var res = await dbUf.rawQuery("SELECT * FROM $tabelaUf");
    return res.toList();
  }

  //Cont UF:
  Future<int> contUfs () async {

    var dbUf = await db;
    return Sqflite.firstIntValue(
        await dbUf.rawQuery("SELECT COUNT(*) FROM $tabelaUf")
    );
  }
//Deletar:
  Future<void> deletarTabelaUf () async {
    var dbUf = await db;
    return await dbUf.rawDelete("DELETE FROM $tabelaUf");

  }

  Future closeDb() async {
    var dbAvaliacoes = await db;
    dbAvaliacoes.close();
  }}











