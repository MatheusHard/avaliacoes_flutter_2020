import 'package:avaliacao_json_novo/models/Uf.dart';
import 'package:avaliacao_json_novo/ui/avaliacoes_db.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class UfApi{

  //static final String URL_API_CIDADES = "api/cidades/index";

  Future <List> getJson() async{

    String url = "http://192.168.1.8:8000/api/ufs/index_api";

    //String url = Utils.URL_WEB_SERVICE + URL_API_CIDADES;
    http.Response response = await http.post(url);

    if(response.statusCode == 200){

      var db = DBAvaliacoes();
      //Limpar dados da Tabela:
      await  db.deletarTabelaUf();
      //Pegar dados da API:
      List _dados = json.decode(response.body);

      for(int i = 0; i < _dados.length; i++) {
        //Inserir no DB interno dados da API:
        await db.inserirUf(new Uf(_dados[i]["descricao_uf"]));
      }
      //Fechar o DB:
      //await db.closeDb();
      return json.decode(response.body);


    }else{
      throw Exception("Falha na Conexão!!");
    }
  }
}