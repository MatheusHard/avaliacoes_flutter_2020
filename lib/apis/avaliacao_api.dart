import 'package:avaliacao_json_novo/utils/utils.dart';
import 'package:http/http.dart' as http;

class AvaliacaoApi{

  String _URL_API_AVALIACOES_POST = "/api/avaliacoes/store_api";

  insertJson(Map avaliacao) async{

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

  }
}
