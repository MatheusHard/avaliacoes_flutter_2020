import 'dart:convert';

import 'package:avaliacao_json_novo/apis/cidade_api.dart';
import 'package:avaliacao_json_novo/apis/uf_api.dart';
import 'package:avaliacao_json_novo/loaders/loader_1.dart';
import 'package:avaliacao_json_novo/models/Cidade.dart';
import 'package:avaliacao_json_novo/ui/avaliacoes_db.dart';
import 'package:avaliacao_json_novo/utils/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sincronismo extends StatefulWidget {
  @override
  _SincronismoState createState() => _SincronismoState();
}

class _SincronismoState extends State<Sincronismo> {
   int cont = 1;
  @override
  void initState() {

    super.initState();
  }

  Future<String> facaAlgo() async {
    return "algo";
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

       /* FutureBuilder(
        // quando você passa a Future para o widget, quando o FutureBuilder for reconstruído,
        // ele vai TESTAR se esse objeto da classe Future é o mesmo de antes dele ser reconstruído,
        // se forem diferentes, ele vai re chamar a Future

        // nesse caso, ele Não vai refazer a chamada, porque o objeto já foi criado no initState e sempre será o mesmo
        future: DBAvaliacoes().getCidades(),

        // nesse caso, ele vai refazer a chamada, porque toda vez que a função facaAlgo é chamada, ela retorna um novo objeto
        // da classe Future
        //  future: facaAlgo(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Center(
            //child:

            //Text(" fiz : ${snapshot.data}"),
          );
        },
      ),*/
          Center(
            child: RaisedButton(

              onPressed:  () => _sincronizar(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors:
                    [ Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                child: Container(
                  constraints: BoxConstraints( maxWidth: 300.0,minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text("Sincronizar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600
                    ),),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }

  _sincronizar (BuildContext context) async{

    int valorCidade;
    int valorUf;

 setState(() {
  CidadeApi().getJson(context).then((value){
    valorCidade = value;
      UfApi().getJson(context).then((value){
        valorUf = value;
          if(valorCidade == 200 && valorUf == 200) {
            Utils().showDefaultSnackbar(context, "Sincronizado com sucesso!!!");
          }else {
            Utils().showDefaultSnackbar(context, "Erro ao sincronizar: C("+valorCidade.toString()+")U("+valorUf.toString()+")");
          }
        });
      });
    });

    }
  }












