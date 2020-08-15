
import 'package:avaliacao_json_novo/apis/cidade_api.dart';
import 'package:avaliacao_json_novo/apis/uf_api.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:avaliacao_json_novo/utils/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sincronismo extends StatefulWidget {
  @override
  _SincronismoState createState() => _SincronismoState();
}

class _SincronismoState extends State<Sincronismo> {
   int cont = 1;
   ProgressDialog _progressDialog;

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


          Center(
            child: RaisedButton(

              onPressed:  (){

                _spinnerSincronizar(context);
                //_sincronizar(context);
                },
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

  /*_sincronizar (BuildContext context) async{

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

    }*/

    _spinnerSincronizar(BuildContext context)  {
      int valorCidade;
      int valorUf;
      var _percentage = 0.0;

    _progressDialog = new ProgressDialog(context);
    _progressDialog =  ProgressDialog(context, type: ProgressDialogType.Download);
     _progressDialog.show();

    Future.delayed(Duration(seconds: 2)).then((value){
      _percentage = _percentage + 33;
      _progressDialog.update(progress: _percentage, message: "Aguarde");

      Future.delayed(Duration(seconds: 2)).then((value){
          _percentage = _percentage + 33;

            CidadeApi().getJson(context).then((value){
              valorCidade = value;
              UfApi().getJson(context).then((value){
                valorUf = value;
                if(valorCidade != 200 || valorUf != 200) {
                  Utils().showDefaultSnackbar(context, "Erro ao sincronizar: C("+valorCidade.toString()+")U("+valorUf.toString()+")");
                  _progressDialog.hide();
                }
              });
            });

          _progressDialog.update(progress: _percentage, message: "Finalizando");

            Future.delayed(Duration(seconds: 2)).then((value){
             _percentage = 100;
            _progressDialog.update(progress: _percentage, message: "Concluido");

             if(valorCidade == 200 && valorUf == 200) {
               Utils().showDefaultSnackbar(context, "Sincronizado com sucesso!!!");
             }
             _progressDialog.hide();

            });
     });
  });

    }
  }












