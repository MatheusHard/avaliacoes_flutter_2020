import 'package:avaliacao_json_novo/models/Avaliacao.dart';
import 'package:avaliacao_json_novo/models/Cidade.dart';
import 'package:avaliacao_json_novo/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Cadastro_Avaliacao extends StatefulWidget {
  @override
  _Cadastro_AvaliacaoState createState() => _Cadastro_AvaliacaoState();
}

class _Cadastro_AvaliacaoState extends State<Cadastro_Avaliacao> {


  TextEditingController _sugestaoController = new TextEditingController();
  TextEditingController _nomeController = new TextEditingController();

  /************SPINNER************/

  static List<Cidade> getCidades(){

    return <Cidade> [
      Cidade("Cabedelo", 16),
      Cidade("João PEssoa", 16),
      Cidade("Recife", 17),
      Cidade("Paulista", 17),
    ];
  }

  List<Cidade> _cidades = getCidades();
  List<DropdownMenuItem<Cidade>> _dropdownMenuItems;
  Cidade _selectedCidade;

  @override
  void initState(){
    _dropdownMenuItems = buildDropdownMenuItems(_cidades);
    _selectedCidade = _dropdownMenuItems[0].value;
    super.initState();
  }
  
  List<DropdownMenuItem<Cidade>> buildDropdownMenuItems (List cidades){
    List<DropdownMenuItem<Cidade>> items = List();
    for(Cidade cidade in cidades){
      items.add(
        DropdownMenuItem(

          value: cidade,
          child: Center(
            child: Text(cidade.descricao_cidade.toUpperCase(),
                        style: TextStyle(
                         fontWeight: FontWeight.w800,
                         color: Colors.teal,
                        fontSize: 15.0
              ),),
          ),
        )
      );
      
    }
   return items;
  }

  onChangedDropdownItem(Cidade selectedCidade){
    setState(() {
      _selectedCidade = selectedCidade;
    });
  }

/****************************8*********************************/

  int _r1 = 0;
  int _r2 = 0;
  int _r3 = 0;
  int _r4 = 0;
  int _r5 = 0;
  int _r6 = 0;
  int _r7 = 0;
  int _r8 = 0;
  int _r9 = 0;
  int _r10 = 0;

  int _group01 = 0;
  int _radioSim1 = 0;
  int _radioNao1 = 0;
  double valor = 5;
  String label = "Valor Selecionado";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child: Container(
          child: Column(
            children: <Widget>[

              _textoSubtitulo(Textos().titulo00),

              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                child: DropdownButton(
                    isExpanded: true,
                    value: _selectedCidade,
                    items: _dropdownMenuItems,
                    onChanged: onChangedDropdownItem),
              ),
              SizedBox(height: 10.0,),
              //Text("Selecionou: ${_selectedCidade.descricao_cidade}"),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: TextField(
                  controller: _nomeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Nome:",
                      hintText: "digite o nome",
                      icon: Icon(Icons.perm_identity)
                  ),
                ),
              ),


              _textoSubtitulo(Textos().sub01_aplicacao),


              RadioListTile(
                      title: _textoNormal(Textos().sim1) ,
                      value: 1,
                      activeColor: Colors.greenAccent,
                      groupValue: _r1,
                      onChanged: (int escolha){
                        setState(() {
                          _r1 = escolha;
                        });
                      }
                  ),
                  RadioListTile(
                      title: _textoNormal(Textos().nao1) ,
                      value: 2,
                      activeColor: Colors.redAccent,
                      groupValue: _r1,
                      onChanged: (int escolha){
                        setState(() {
                          _r1 = escolha;
                        });
                      }
                  ),

              _textoSubtitulo(Textos().sub01_aplicacao),

              RadioListTile(
                  title: Text(Textos().sim1) ,
                  value: 1,
                  activeColor: Colors.greenAccent,
                  groupValue: _group01,
                  onChanged: (int escolha){
                    setState(() {
                      _group01 = escolha;
                    });
                  }
              ),
              RadioListTile(
                  title: Text(Textos().nao1) ,
                  value: 2,
                  activeColor: Colors.redAccent,
                  groupValue: _group01,
                  onChanged: (int escolha){
                    setState(() {
                      _group01 = escolha;
                    });
                  }
              ),

               _textoSubtitulo(Textos().sub02_clareza),

              RadioListTile(
                  title: Text(Textos().sim1) ,
                  value: 1,
                  activeColor: Colors.greenAccent,
                  groupValue: _group01,
                  onChanged: (int escolha){
                    setState(() {
                      _group01 = escolha;
                    });
                  }
              ),
              RadioListTile(
                  title: Text(Textos().nao1) ,
                  value: 2,
                  activeColor: Colors.redAccent,
                  groupValue: _group01,
                  onChanged: (int escolha){
                    setState(() {
                      _group01 = escolha;
                    });
                  }
              ),
              RaisedButton(
                child: Text("Aperte",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                onPressed: _resultado
              ),

            ],
          ),
        ),
      ),
      )
    );
  }

  void _resultado (){
    Avaliacao a;
    setState(() {
     a = new Avaliacao();

      //Validação 02:
      if(_r1 > 0 ){

      /*********Radio 01*********/

        switch(_r1){
          case 1:
            a.radioSim_1 = 1;
            a.radioNao_1 = 0;
            break;
          case 2:
            a.radioSim_1 = 0;
            a.radioNao_1 = 1;
            break;
          }

      /*  switch(_r2){
          case 1:
            _radioSim1 = 1;
            _radioNao1 = 0;
            break;
          case 2:
            _radioNao1 = 1;
            _radioSim1 = 0;
            break;
        }*/
      //Fim validação 02:
    }else{ print("Preencha uma opção, por favor!!!");}


    }
      );




    print("Resultado: " + _group01.toString()
        + " -- Sim: " + a.radioSim_1.toString()
        + " -- Não:"  +a.radioNao_1.toString());

  }



  Padding _textotitulo(String valor){

    Padding texto = Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Text(valor,
          style: TextStyle(
              color: Colors.black26,
              fontSize: 25.0,
              fontWeight: FontWeight.bold
          ),
        )
    );
    return texto;
  }
  Padding _textoSubtitulo(String valor){

    Padding texto = Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Text(valor,
                    style: TextStyle(
                    color: Colors.black45,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
    ),
    )
    );
    return texto;
  }

  Padding _textoNormal(String valor){

    Padding texto = Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        child:  Text(valor,
          style: TextStyle(
              color: Colors.black26,
              fontSize: 12.0,
              fontWeight: FontWeight.bold
          ),
        )
    );
    return texto;
  }
}
