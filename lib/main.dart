
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/Avaliacao.dart';


void main() async {


  var a = new Avaliacao();
  a.dataHora = DateTime.now();

  //initializeDateFormatting("pt_BR", null);
  //var formta  = DateFormat.yMMMMd("pt_BR");

  print("Data: " + a.dataHora.toString());

  //Lembrar de colocar esta função abaixo dentro no main, não sei porque, so funciona, kkkkk:
  WidgetsFlutterBinding.ensureInitialized();

  //Contagem:
  // int cont = await db.contCidades();

//for(int i = 0; i < _dados.length; i++) {
//  print(_dados[i]['descricao_cidade']);
//  }
//  print("Total Cidades:  $cont");

  //Chamar APIS:
  //await CidadeApi().getJson();
  //await UfApi().getJson();

  //await db.inserirUf(new Uf("PB"));
  //PEgar Ufs:
  /*List _dados = await db.getCidades();


  for(int i = 0; i < _dados.length; i++) {
    print(_dados[i]['id']);
    print(_dados[i]['descricao_cidade']);
  }*/

  //Add Cidade:

  //int resultado =  await db.inserirCidade(new Cidade("JUripiranga", 26));
  //print("Cidade: $resultado");

  runApp(
      new Home()
  );
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Avaliações"),
          backgroundColor: Colors.black38,
          centerTitle: true,
        ),
      ),
    );
  }
}
