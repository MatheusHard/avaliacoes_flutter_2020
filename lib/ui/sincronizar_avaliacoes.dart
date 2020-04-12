import 'package:avaliacao_json_novo/apis/cidade_api.dart';
import 'package:avaliacao_json_novo/apis/uf_api.dart';
import 'package:avaliacao_json_novo/loaders/loader_1.dart';
import 'package:avaliacao_json_novo/ui/avaliacoes_db.dart';
import 'package:avaliacao_json_novo/utils/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sincronismo extends StatefulWidget {
  @override
  _SincronismoState createState() => _SincronismoState();
}

class _SincronismoState extends State<Sincronismo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          RaisedButton(
            //onPressed: () => ShowSnackBar().showDefaultSnackbar(context, "SALVO"),
            onPressed:  () => _sincronizar(context, "Sincronizado com sucesso!!!"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [ Color(0xFF0D47A1),
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
                      color: Colors.white
                  ),),
              ),
            ),
          )
        ],
      ),

    );
  }

  _sincronizar (BuildContext context, String texto){

    CidadeApi().getJson();
    UfApi().getJson();
    Utils().showDefaultSnackbar(context, texto);

  }

}









