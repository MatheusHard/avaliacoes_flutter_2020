import 'package:avaliacao_json_novo/models/Uf.dart';
import 'package:avaliacao_json_novo/ui/avaliacoes_db.dart';
import 'package:avaliacao_json_novo/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class UfApi{

 String _URL_API_UFS = "api/uf";

 Future<int> getJson(BuildContext context) async{

    String _url = Utils().URL_WEB_SERVICE + _URL_API_UFS;
    http.Response response = await http.post(_url);

    if(response.statusCode == 200){

      DBAvaliacoes db = new DBAvaliacoes();
      //var db = DBAvaliacoes();
      //Limpar dados da Tabela:
      //await  db.deletarTabelaUf();
      //Pegar dados da API:
      List _dados = json.decode(response.body);

      for(int i = 0; i < _dados.length; i++) {
        //Inserir no DB interno dados da API:
        await db.inserirUf(new Uf(_dados[i]["descricao_uf"]));
      }
      //Fechar o DB:
      //await db.closeDb();
      List u = await db.getUfs();
      print(u);
    // await db.closeDb();
      //return json.decode(response.body);
      return response.statusCode;

    }else{
      return response.statusCode;

    }
  }
}