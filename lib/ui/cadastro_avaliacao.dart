import 'package:avaliacao_json_novo/models/Cidade.dart';
import 'package:avaliacao_json_novo/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Cadastro_Avaliacao extends StatefulWidget {
  @override
  _Cadastro_AvaliacaoState createState() => _Cadastro_AvaliacaoState();
}

class _Cadastro_AvaliacaoState extends State<Cadastro_Avaliacao> {

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
          child: Text(cidade.descricao_cidade),
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
        padding: const EdgeInsets.all(60),
        child: Container(
          child: Column(
            children: <Widget>[

              Text("Selecione a Cidade"),
              SizedBox(height: 20.0,),
              DropdownButton(
                  value: _selectedCidade,
                  items: _dropdownMenuItems,
                  onChanged: onChangedDropdownItem),
              SizedBox(height: 20.0,),
              Text("Selecionou: ${_selectedCidade.descricao_cidade}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Textos().prop),
              ),
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Textos().prop),
              ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Textos().prop),
              ),
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

              /********************OUTRO**************************/
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text("*******************************"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Textos().prop),
              ),
              Slider(
                  value: valor,
                  min: 0,
                  max: 10,
                  label: label,
                  divisions: 10,
                  activeColor: Colors.green,
                  inactiveColor: Colors.black26,
                  onChanged: (double novoValor){
                    setState(() {
                      valor = novoValor;
                      label =  novoValor.toString();
                    //  print("Valor: "+ novoValor.toString());
                    });
                  }),
              RaisedButton(
                  child: Text("Aperte",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: (){
                    print("Valor: "+ valor.toString());

                  }
              )
            ],
          ),
        ),
      ),
      )
    );
  }

  void _resultado (){

    setState(() {
      if(_group01 == 0){
        print("Preencha uma opção, por favor!!!");
       }

      /*********Radios*********/

      if(_group01 == 1){
        _radioSim1 = 1;
        _radioNao1 = 0;
      }if(_group01 == 2){
        _radioNao1 = 1;
        _radioSim1 = 0;
      }
    });
    print("Resultado: " + _group01.toString()
        + " -- Sim: " + _radioSim1.toString()
        + " -- Não:"  +_radioNao1.toString());

  }
}
