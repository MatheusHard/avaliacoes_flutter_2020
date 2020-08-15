
import 'package:avaliacao_json_novo/models/Cidade.dart';
import 'package:avaliacao_json_novo/ui/avaliacoes_db.dart';
import 'package:avaliacao_json_novo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CidadeApi{

  String _URL_API_CIDADES_GET = "api/cidades/index_api";
  String _URL_API_CIDADES_POST = "api/cidades/store_api";

  Future<int> getJson(BuildContext context) async{


      //String url = Utils().URL_WEB_SERVICE + _URL_API_CIDADES_GET;
    String url = Utils().URL_WEB_SERVICE + "cidade";
    http.Response response = await http.post(url);

    if(response.statusCode == 200) {
      DBAvaliacoes db = new DBAvaliacoes();
      await db.deletarTabelaCidade();

    //Pegar dados da API:
    List _dados = json.decode(response.body);

  for (int i = 0; i < _dados.length; i++) {
    //Inserir no DB interno dados da API:
    await db.inserirCidade(new Cidade(_dados[i]["descricao_cidade"], _dados[i]["uf_id"], null));
  }

  //return json.decode(response.body);
      return response.statusCode;

}else{
      return response.statusCode;

    }
  }
  /************ENVIAR***************/

  insertJson(Map cidade) async{
    String url = Utils().URL_WEB_SERVICE + _URL_API_CIDADES_POST;

    http.Response response = await http.post(
      url,
      headers: {
       "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
      },
      body: cidade
    );
    print("Status: "+response.statusCode.toString());
    print("Body: "+response.body.toString());

  }
}

