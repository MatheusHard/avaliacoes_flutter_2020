import 'package:avaliacao_json_novo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AvaliacaoApi{

  String _ok = "Avaliação enviada com sucesso...";
  String _erro = "Ocorreu um erro ao enviar a Avaliação: ";
  String _URL_API_AVALIACOES_POST = "api/avaliacao/add";

  insertJson(Map avaliacao, BuildContext context) async {

    String url = Utils().URL_WEB_SERVICE + _URL_API_AVALIACOES_POST;
    http.Response response = await http.post(
        url,
        headers: {
          "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
        },
        body: avaliacao
    );

    print("Status: "+response.statusCode.toString());
    print("Body: "+response.body.toString());


    if(response.statusCode == 200 || response.statusCode == 201){
      Utils().showDefaultSnackbar(context, _ok);
    }else{
      Utils().showDefaultSnackbar(context, _erro + response.statusCode.toString()+response.body);
      print(response.body);
    }
  }
}
