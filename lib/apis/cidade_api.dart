
import 'package:avaliacao_json_novo/models/Cidade.dart';
import 'package:avaliacao_json_novo/ui/avaliacoes_db.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CidadeApi{

  //static final String URL_API_CIDADES = "api/cidades/index";

  Future <List> getJson() async{

  String url = "http://192.168.1.8:8000/api/cidades/index_api";

  //String url = Utils.URL_WEB_SERVICE + URL_API_CIDADES;
  http.Response response = await http.post(url);

  if(response.statusCode == 200){

    DBAvaliacoes db = new DBAvaliacoes();

   /*if((db.contCidades() != null) && (await db.contCidades() > 0)) {
    //Limpar dados da Tabela:
    await db.deletarTabelaCidade();
    }*/
    await db.deletarTabelaCidade();

    //Pegar dados da API:
    List _dados = json.decode(response.body);

    for(int i = 0; i < _dados.length; i++) {
      //Inserir no DB interno dados da API:
      await db.inserirCidade(new Cidade(_dados[i]["descricao_cidade"],  _dados[i]["uf_id"]));
    }
    //Fechar o DB:
    //await db.closeDb();
    return json.decode(response.body);


  }else{
    throw Exception("Falha na Conexão!!");
    }
  }
}