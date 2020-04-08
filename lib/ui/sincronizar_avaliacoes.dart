import 'package:avaliacao_json_novo/apis/cidade_api.dart';
import 'package:avaliacao_json_novo/apis/uf_api.dart';
import 'package:avaliacao_json_novo/ui/avaliacoes_db.dart';
import 'package:flutter/material.dart';

class ModuloSincronismo {

DBAvaliacoes db = new DBAvaliacoes();

  Container sincronismo(){

return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),

                    onPressed: _sincronizar,

                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(

                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),

                      child: const Text(
                          'Gradient Button',
                          style: TextStyle(fontSize: 20)
                      ),
                    ),
                  ),
          ],
        ),

    );
}

  _sincronizar  (){

 // WidgetsFlutterBinding.ensureInitialized();
  CidadeApi().getJson();
  UfApi().getJson();

  }
}