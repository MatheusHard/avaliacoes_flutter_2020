
import 'package:avaliacao_json_novo/models/Cidade.dart';
import 'package:avaliacao_json_novo/strings/strings.dart';
import 'package:avaliacao_json_novo/ui/avaliacoes_db.dart';
import 'package:avaliacao_json_novo/ui/cadastro_avaliacao.dart';
import 'package:avaliacao_json_novo/ui/sincronizar_avaliacoes.dart';
import 'package:avaliacao_json_novo/utils/utils.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'apis/cidade_api.dart';
import 'models/Avaliacao.dart';


void main() async {
//TEste API Cidade Post:
  //CidadeApi().insertJson(new Cidade("Atalia", 15, null).toJson());
  //print(cidade.toJson());

  //DBAvaliacoes db = new DBAvaliacoes();
 // var a = new Avaliacao();
  //a.dataHora = DateTime.now();

  //initializeDateFormatting("pt_BR", null);
  //var formta  = DateFormat.yMMMMd("pt_BR");

  //print("Data: " + a.dataHora.toString());

  //Lembrar de colocar esta função abaixo dentro no main, não sei porque, so funciona, kkkkk:
  //WidgetsFlutterBinding.ensureInitialized();

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
 /* List _dados = await db.getCidades();


  for(int i = 0; i < _dados.length; i++) {
    print(_dados[i]['id']);
    print(_dados[i]['descricao_cidade']);
  }*/

  //Add Cidade:

  //int resultado =  await db.inserirCidade(new Cidade("JUripiranga", 26));
  //print("Cidade: $resultado");

  runApp(

    new MaterialApp(
        home:  Home()
      //home: Cadastro_Avaliacao()
  )

  );
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [
    Center(child: Text("Home")),
    Cadastro_Avaliacao(),
    Sincronismo(),
    Center(child: Text("EXIT"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Text("Avaliações",
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),

        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
           Icon(Icons.home, size: 20, color: Colors.white,),
          Icon(Icons.add, size: 20, color: Colors.white,),
          Icon(Icons.cloud_download, size: 20, color: Colors.white,),
          Icon(Icons.exit_to_app, size: 20, color: Colors.white,),
        ],
        color: Colors.red,
        buttonBackgroundColor: Colors.red,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInCubic,
        animationDuration: Duration(milliseconds: 600),
        index: 0,
        height: 50,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ) /*BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 12.0,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white,),
              backgroundColor: Colors.orangeAccent,
              title: Text(Textos().home, style: TextStyle(color: Colors.white),)),
          BottomNavigationBarItem(icon: Icon(Icons.add, color: Colors.white,),
              backgroundColor: Colors.greenAccent,
              title: Text(Textos().cadastrar, style: TextStyle(color: Colors.white),)),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_download, color: Colors.white,),
              backgroundColor: Colors.blueAccent,
              title: Text(Textos().sincronizar, style: TextStyle(color: Colors.white),)),
          BottomNavigationBarItem(icon: Icon(Icons.exit_to_app, color: Colors.white,),
              backgroundColor: Colors.redAccent,
              title: Text(Textos().sair, style: TextStyle(color: Colors.white),)),

        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),*/

    );
  }
}
