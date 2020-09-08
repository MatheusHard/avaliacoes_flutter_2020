import 'dart:convert';
import 'dart:core';

import 'package:avaliacao_json_novo/apis/avaliacao_api.dart';
import 'package:avaliacao_json_novo/apis/cidade_api.dart';
import 'package:avaliacao_json_novo/models/Avaliacao.dart';
import 'package:avaliacao_json_novo/models/Cidade.dart';
import 'package:avaliacao_json_novo/models/Profissional.dart';
import 'package:avaliacao_json_novo/strings/strings.dart';
import 'package:avaliacao_json_novo/ui/avaliacoes_db.dart';
import 'package:avaliacao_json_novo/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';


class Cadastro_Avaliacao extends StatefulWidget {
  @override
  _Cadastro_AvaliacaoState createState() => _Cadastro_AvaliacaoState();
}

class _Cadastro_AvaliacaoState extends State<Cadastro_Avaliacao> {

  ProgressDialog _progressDialog;

  int _radioSim_1, _radioNao_1;
  int _radioMuito_2, _radiobom_2, _radioRegular_2, _radioRuim_2;
  int _radioSeguro_3, _radioPoucoSeguro_3, _radioInseguro_3;
  int _radioExcessiva_4, _radioRazoavel_4, _radioInsuficiente_4;
  int _radioMuito_5, _radiobom_5, _radioRegular_5, _radioRuim_5;
  int _radioMuito_6, _radiobom_6, _radioRegular_6, _radioRuim_6;
  int _radioMuito_7, _radiobom_7, _radioRegular_7, _radioRuim_7;
  int _radioMuito_8, _radiobom_8, _radioRegular_8, _radioRuim_8;
  int _radioMuito_9, _radiobom_9, _radioRegular_9, _radioRuim_9;
  int _radioMuito_10, _radiobom_10, _radioRegular_10, _radioRuim_10;

  String _nomeAgente;
  String _cpf;
  String _sugestoes;
  int _tipoAgente;
  String _nomeTipoAgente;
  //TODO
  DateTime _dataHora = Utils().getDataHora();
  int _idCidade;

  List<Cidade> _listaCidades = List<Cidade>();
  List<Profissional> _listaProfissionais = List<Profissional>();

  FocusNode _myFocusNode;
  FocusNode _myFocusNode_2;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _sugestaoController = new TextEditingController();
  TextEditingController _nomeController = new TextEditingController();
  TextEditingController _cpfController = new TextEditingController();


  @override
  void initState (){
    getCidades();
    getProfissionais();
    _myFocusNode = FocusNode();
    _myFocusNode_2 = FocusNode();

    super.initState();
  }

  /************DropDown Cidades************/

  List<DropdownMenuItem<Cidade>> _dropdownMenuItemsCidades;
  Cidade _selectedCidade = null;
  
  List<DropdownMenuItem<Cidade>> buildDropdownMenuItemsCidades (List cidades){
    List<DropdownMenuItem<Cidade>> items = List();
    for(Cidade cidade in cidades){
    items.add(
        DropdownMenuItem(


      value: cidade,
          child: Center(


        child: _validarTextoDropdownCidade(cidade.id, cidade.descricao_cidade.toUpperCase() +"/"+ cidade.uf.descricao_uf.toUpperCase()),

            /* Text(

          cidade.descricao_cidade.toUpperCase() +"/"+ cidade.uf.descricao_uf.toUpperCase(),
                        style: TextStyle(
                         fontWeight: FontWeight.w800,
                         color: Colors.teal,
                        fontSize: 15.0
              ),),*/


          ),
        )
      );
      
    }
   return items;
  }

  onChangedDropdownItemCidade(Cidade selectedCidade){
    setState(() {
      _selectedCidade = selectedCidade;
    });
  }
  /************DropDown Profissionais************/

  List<DropdownMenuItem<Profissional>> _dropdownMenuItemsProfissionais;
  Profissional _selectedProfissional = null;

  List<DropdownMenuItem<Profissional>> buildDropdownMenuItemsProfissionais (List profissionais){
    List<DropdownMenuItem<Profissional>> items = List();
    for(Profissional profissional in profissionais){
      //for(int i=0; i < cidades.length; i++){
      items.add(
          DropdownMenuItem(

            value: profissional,
            child: Center(
              child: Text(profissional.descricao_profisssao.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                    fontSize: 15.0
                ),),
            ),
          )
      );

    }
    return items;
  }

  onChangedDropdownItemProfissional(Profissional selectedProfissional){
    setState(() {
      _selectedProfissional = selectedProfissional;
    });
  }

/****************************RADIOS*********************************/

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

 String label = "Valor Selecionado";


  @override
  Widget build(BuildContext context) {
  //  _getCitys();

    return Scaffold(

      body:

      SingleChildScrollView(

      child: Container(
        margin: EdgeInsets.all(0.0),
        color: Colors.white,
        child: Padding(

          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          child: Container(
            margin: EdgeInsets.all(0.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: 30.0,),
                _textoTitulo(Textos().titulo00_dados),

                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                  child:

                  InputDecorator(

                    decoration: InputDecoration(

                      border: InputBorder.none,
                      icon: Icon(Icons.location_city),
                      labelText: Textos().titulo06_Cidade,
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                      )
                    ),
                    child:
                  DropdownButton(

                      style: TextStyle(inherit: false, color: Colors.white, decorationColor: Colors.white),
                     // icon: Icon(Icons.location_city, textDirection: TextDirection.ltr,),

                      hint: Text("Selecione a Cidade"),
                      isExpanded: true,
                      value: _selectedCidade,

                      items: _dropdownMenuItemsCidades,
                      onChanged: onChangedDropdownItemCidade),
                )),
                SizedBox(height: 10.0,),
                //Text("Selecionou: ${_selectedCidade.descricao_cidade}"),

                /**Drop Profissionais**/
                Padding(
                    padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                    child:

                    InputDecorator(

                      decoration: InputDecoration(

                          border: InputBorder.none,
                          icon: Icon(Icons.phonelink),
                          labelText: Textos().titulo08_prof,
                          labelStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      child:
                      DropdownButton(

                          style: TextStyle(inherit: false, color: Colors.white, decorationColor: Colors.white),
                          // icon: Icon(Icons.location_city, textDirection: TextDirection.ltr,),

                          hint: Text("Selecione a Profissão"),
                          isExpanded: true,
                          value: _selectedProfissional,
                          items: _dropdownMenuItemsProfissionais,
                          onChanged: onChangedDropdownItemProfissional),
                    )),
                SizedBox(height: 10.0,),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                    /**********Nome Profissional**********/
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: TextFormField(
                        controller: _nomeController,
                        focusNode: _myFocusNode,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Nome:",
                            hintText: "digite o nome",
                            icon: Icon(Icons.perm_identity)
                        ),
                        validator: (value){
                          if(value.isEmpty || value == ""){
                            _myFocusNode.requestFocus();
                            Utils().showDefaultSnackbar(context, "Insira seu nome!!!");
                            return Textos().validar_nome;

                          }
                        },
                      ),
                    ),

                    /**********CPF**********/

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: TextFormField(
                        controller: _cpfController,
                        focusNode: _myFocusNode_2,
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Cpf:",
                            hintText: "digite o cpf",
                            icon: Icon(Icons.credit_card)
                        ),
                        validator: (value){

                            if(value.isNotEmpty || value != ""){
                              if(!Utils().validarCPF(value)){
                                _myFocusNode_2.requestFocus();
                                Utils().showDefaultSnackbar(context, "Cpf inválido!!!");
                               // return Textos().validar_nome;
                              }
                            }else{
                              _myFocusNode_2.requestFocus();
                              Utils().showDefaultSnackbar(context, "Insira o Cpf!!!");
                              return Textos().validar_cpf;
                            }



                        },
                      ),
                    ),
                  ],
                )),

                _textoTitulo(Textos().titulo01),
                SizedBox(height: 10.0,),
                _textoSubtitulo(Textos().sub01_aplicacao),

                /**********RADIO 01**********/

                RadioListTile(
                        title: _textoNormal(Textos().proporcionou_1) ,
                        value: 1,
                        activeColor: Colors.green,
                        groupValue: _r1,
                        onChanged: (int escolha){
                          setState(() {
                            _r1 = escolha;
                          });
                        }
                    ),
                    RadioListTile(
                        title: _textoNormal(Textos().nao_proporcionou_1) ,
                        value: 2,
                        activeColor: Colors.redAccent,
                        groupValue: _r1,
                        onChanged: (int escolha){
                          setState(() {
                            _r1 = escolha;
                          });
                        }
                    ),

                SizedBox(height: 10.0,),

                /**********RADIO 02**********/

                _textoTitulo(Textos().titulo02),
                SizedBox(height: 10.0,),
                _textoSubtitulo(Textos().sub02_clareza),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: Radio(

                                activeColor: Colors.green,
                                value: 1,
                                groupValue: _r2,
                                onChanged: (int escolha){
                                setState(() {
                                  _r2 = escolha;
                                });
                              },
                            ),
                        ),
                     ),

                      _textoNormal(Textos().muito_bom),

                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.blueAccent,
                            value: 2,
                            groupValue: _r2,
                            onChanged: (int escolha){
                              setState(() {
                                _r2 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.orangeAccent,
                            groupValue: _r2,
                            value: 3,
                            onChanged: (int escolha){
                              setState(() {
                                _r2 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().regular),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.redAccent,
                            groupValue: _r2,
                            value: 4,
                            onChanged: (int escolha){
                              setState(() {
                                _r2 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().ruim)
                    ],
                  ),
                ),
                 Divider(height: 20.0,),

                /**********RADIO 03**********/

                _textoSubtitulo(Textos().sub01_aplicacao),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                    RadioListTile(
                          title: _textoNormal(Textos().seguro) ,
                          value: 1,
                          activeColor: Colors.green,
                          groupValue: _r3,
                          onChanged: (int escolha){
                            setState(() {
                              _r3 = escolha;
                            });
                          }
                      ),
                   RadioListTile(
                          title: _textoNormal(Textos().pouco_seguro) ,
                          value: 2,
                          activeColor: Colors.orangeAccent,
                          groupValue: _r3,
                          onChanged: (int escolha){
                            setState(() {
                              _r3 = escolha;
                            });
                          }
                      ),

                      RadioListTile(
                          title: _textoNormal(Textos().inseguro) ,
                          value: 3,
                          activeColor: Colors.redAccent,
                          groupValue: _r3,
                          onChanged: (int escolha){
                            setState(() {
                              _r3 = escolha;
                            });
                          }
                      ),

                     ],
                  ),
                ),
                Divider(height: 20.0,),

                /**********RADIO 04**********/

                _textoSubtitulo(Textos().sub03_carga),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.green,
                            value: 1,
                            groupValue: _r4,
                            onChanged: (int escolha){
                              setState(() {
                                _r4 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().excessiva),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.orangeAccent,
                            value: 2,
                            groupValue: _r4,
                            onChanged: (int escolha){
                              setState(() {
                                _r4 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().razoavel),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.redAccent,
                            groupValue: _r4,
                            value: 3,
                            onChanged: (int escolha){
                              setState(() {
                                _r4 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().insuficiente),

                    ],
                  ),
                ),
                SizedBox(height: 20.0,),

                /**********RADIO 05**********/

                _textoTitulo(Textos().titulo03_instru),
                SizedBox(height: 10.0,),
                _textoSubtitulo(Textos().sub04_conhecimento),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.green,
                            value: 1,
                            groupValue: _r5,
                            onChanged: (int escolha){
                              setState(() {
                                _r5 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().muito_bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.blueAccent,
                            value: 2,
                            groupValue: _r5,
                            onChanged: (int escolha){
                              setState(() {
                                _r5 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.orangeAccent,
                            groupValue: _r5,
                            value: 3,
                            onChanged: (int escolha){
                              setState(() {
                                _r5 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().regular),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.redAccent,
                            groupValue: _r5,
                            value: 4,
                            onChanged: (int escolha){
                              setState(() {
                                _r5 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().ruim)
                    ],
                  ),
                ),
                Divider(height: 20.0,),

                /**********RADIO 06**********/

                      _textoSubtitulo(Textos().sub05_clareza_ex),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              fit: FlexFit.loose,
                              child: SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: Radio(
                                  activeColor: Colors.green,
                                  value: 1,
                                  groupValue: _r6,
                                  onChanged: (int escolha){
                                    setState(() {
                                      _r6 = escolha;
                                    });
                                  },
                                ),
                              ),
                            ),
                            _textoNormal(Textos().muito_bom),
                            Flexible(
                              fit: FlexFit.loose,
                              child: SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: Radio(
                                  activeColor: Colors.blueAccent,
                                  value: 2,
                                  groupValue: _r6,
                                  onChanged: (int escolha){
                                    setState(() {
                                      _r6 = escolha;
                                    });
                                  },
                                ),
                              ),
                            ),
                            _textoNormal(Textos().bom),
                            Flexible(
                              fit: FlexFit.loose,
                              child: SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: Radio(
                                  activeColor: Colors.orangeAccent,
                                  groupValue: _r6,
                                  value: 3,
                                  onChanged: (int escolha){
                                    setState(() {
                                      _r6 = escolha;
                                    });
                                  },
                                ),
                              ),
                            ),
                            _textoNormal(Textos().regular),
                            Flexible(
                              fit: FlexFit.loose,
                              child: SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: Radio(
                                  activeColor: Colors.redAccent,
                                  groupValue: _r6,
                                  value: 4,
                                  onChanged: (int escolha){
                                    setState(() {
                                      _r6 = escolha;
                                    });
                                  },
                                ),
                              ),
                            ),
                            _textoNormal(Textos().ruim)

                    ],
                  ),
                ),
                Divider(height: 20.0,),

                /**********RADIO 07**********/

                _textoSubtitulo(Textos().sub06_disponibilidade),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.green,
                            value: 1,
                            groupValue: _r7,
                            onChanged: (int escolha){
                              setState(() {
                                _r7 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().muito_bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.blueAccent,
                            value: 2,
                            groupValue: _r7,
                            onChanged: (int escolha){
                              setState(() {
                                _r7 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.orangeAccent,
                            groupValue: _r7,
                            value: 3,
                            onChanged: (int escolha){
                              setState(() {
                                _r7 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().regular),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.redAccent,
                            groupValue: _r7,
                            value: 4,
                            onChanged: (int escolha){
                              setState(() {
                                _r7 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().ruim)
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                /**********RADIO 08**********/

                _textoTitulo(Textos().titulo04_equi),
                SizedBox(height: 10.0,),
                _textoSubtitulo(Textos().sub04_conhecimento),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.green,
                            value: 1,
                            groupValue: _r8,
                            onChanged: (int escolha){
                              setState(() {
                                _r8 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().muito_bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.blueAccent,
                            value: 2,
                            groupValue: _r8,
                            onChanged: (int escolha){
                              setState(() {
                                _r8 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.orangeAccent,
                            groupValue: _r8,
                            value: 3,
                            onChanged: (int escolha){
                              setState(() {
                                _r8 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().regular),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.redAccent,
                            groupValue: _r8,
                            value: 4,
                            onChanged: (int escolha){
                              setState(() {
                                _r8 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().ruim)
                    ],
                  ),
                ),
                Divider(height: 20.0,),

                /**********RADIO 09**********/

                _textoSubtitulo(Textos().sub05_clareza_ex),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.green,
                            value: 1,
                            groupValue: _r9,
                            onChanged: (int escolha){
                              setState(() {
                                _r9 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().muito_bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.blueAccent,
                            value: 2,
                            groupValue: _r9,
                            onChanged: (int escolha){
                              setState(() {
                                _r9 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.orangeAccent,
                            groupValue: _r9,
                            value: 3,
                            onChanged: (int escolha){
                              setState(() {
                                _r9 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().regular),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.redAccent,
                            groupValue: _r9,
                            value: 4,
                            onChanged: (int escolha){
                              setState(() {
                                _r9 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().ruim)
                    ],
                  ),
                ),
                Divider(height: 20.0,),

                /**********RADIO 10**********/

                _textoSubtitulo(Textos().sub06_disponibilidade),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.green,
                            value: 1,
                            groupValue: _r10,
                            onChanged: (int escolha){
                              setState(() {
                                _r10 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().muito_bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.blueAccent,
                            value: 2,
                            groupValue: _r10,
                            onChanged: (int escolha){
                              setState(() {
                                _r10 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().bom),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.orangeAccent,
                            groupValue: _r10,
                            value: 3,
                            onChanged: (int escolha){
                              setState(() {
                                _r10 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().regular),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Radio(
                            activeColor: Colors.redAccent,
                            groupValue: _r10,
                            value: 4,
                            onChanged: (int escolha){
                              setState(() {
                                _r10 = escolha;
                              });
                            },
                          ),
                        ),
                      ),
                      _textoNormal(Textos().ruim)
                    ],
                  ),
                ),
                Divider(height: 20.0,),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                  child: TextField(
                    controller: _sugestaoController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: "Sugestões:",
                        hintText: "digite sua sugestão",
                        icon: Icon(Icons.chat)
                    ),
                  ),
                ),
                /***************************/
                SizedBox(height: 20.0,),
                RaisedButton(

                  onPressed: (){
                      //TODO
                      //Essa Validação pode não funcionar quando dropdown está vazio:
                      if(_listaCidades.isNotEmpty){
                        if(_formKey.currentState.validate()){
                          _cadastarAvaliacao();
                        }}else{
                        Utils().showDefaultSnackbar(context, "Realize o sincronismo para receber aas Cidades!!!");
                      }
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
                      child: Text("Cadastrar",
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
                SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
      ),
      )
    );
  }

  void _cadastarAvaliacao (){

  setState(() {
    //TODO

    _nomeAgente = _nomeController.text;
    _sugestoes = _sugestaoController.text;
    _cpf = _cpfController.text;
    _tipoAgente = _selectedProfissional.id;
    _nomeTipoAgente = _selectedProfissional.descricao_profisssao;
    _idCidade = _selectedCidade.id;
    _dataHora = DateTime.now();


    //Validação 01:
    if (_selectedCidade != null && _selectedCidade.id > 1) {
      //Validação 02:
      // if (!(_nomeAgente == "") && !(_nomeAgente == null)) {
      //Validação 03:
      if (_selectedProfissional != null && _selectedProfissional.id > 1) {
        //Validação 04:
        // if (!(_cpf == "") && !(_cpf == null)) {
        //Validação 05:
        if (_r1 > 0 && _r2 > 0 && _r3 > 0 && _r4 > 0 && _r5 > 0 && _r6 > 0 &&
            _r7 > 0 && _r8 > 0 && _r9 > 0 && _r10 > 0) {

          /*********Radio 01*********/

          switch (_r1) {
            case 1:
              _radioSim_1 = 1;
              _radioNao_1 = 0;
              break;
            case 2:
              _radioSim_1 = 0;
              _radioNao_1 = 1;
              break;
          }

          /*********Radio 02*********/

          switch (_r2) {
            case 1:
              _radioMuito_2 = 1;
              _radiobom_2 = 0;
              _radioRegular_2 = 0;
              _radioRuim_2 = 0;
              break;
            case 2:
              _radioMuito_2 = 0;
              _radiobom_2 = 1;
              _radioRegular_2 = 0;
              _radioRuim_2 = 0;
              break;
            case 3:
              _radioMuito_2 = 0;
              _radiobom_2 = 0;
              _radioRegular_2 = 1;
              _radioRuim_2 = 0;
              break;
            case 4:
              _radioMuito_2 = 0;
              _radiobom_2 = 0;
              _radioRegular_2 = 0;
              _radioRuim_2 = 1;
              break;
          }

          /*********Radio 03*********/

          switch (_r3) {
            case 1:
              _radioSeguro_3 = 1;
              _radioPoucoSeguro_3 = 0;
              _radioInseguro_3 = 0;
              break;
            case 2:
              _radioSeguro_3 = 0;
              _radioPoucoSeguro_3 = 1;
              _radioInseguro_3 = 0;
              break;
            case 3:
              _radioSeguro_3 = 0;
              _radioPoucoSeguro_3 = 0;
              _radioInseguro_3 = 1;
              break;
          }

          /*********Radio 04*********/

          switch (_r4) {
            case 1:
              _radioExcessiva_4 = 1;
              _radioRazoavel_4 = 0;
              _radioInsuficiente_4 = 0;
              break;
            case 2:
              _radioExcessiva_4 = 0;
              _radioRazoavel_4 = 1;
              _radioInsuficiente_4 = 0;
              break;
            case 3:
              _radioExcessiva_4 = 0;
              _radioRazoavel_4 = 0;
              _radioInsuficiente_4 = 1;
              break;
          }

          /*********Radio 05*********/

          switch (_r5) {
            case 1:
              _radioMuito_5 = 1;
              _radiobom_5 = 0;
              _radioRegular_5 = 0;
              _radioRuim_5 = 0;
              break;
            case 2:
              _radioMuito_5 = 0;
              _radiobom_5 = 1;
              _radioRegular_5 = 0;
              _radioRuim_5 = 0;
              break;
            case 3:
              _radioMuito_5 = 0;
              _radiobom_5 = 0;
              _radioRegular_5 = 1;
              _radioRuim_5 = 0;
              break;
            case 4:
              _radioMuito_5 = 0;
              _radiobom_5 = 0;
              _radioRegular_5 = 0;
              _radioRuim_5 = 1;
              break;
          }
          /*********Radio 06*********/

          switch (_r6) {
            case 1:
              _radioMuito_6 = 1;
              _radiobom_6 = 0;
              _radioRegular_6 = 0;
              _radioRuim_6 = 0;
              break;
            case 2:
              _radioMuito_6 = 0;
              _radiobom_6 = 1;
              _radioRegular_6 = 0;
              _radioRuim_6 = 0;
              break;
            case 3:
              _radioMuito_6 = 0;
              _radiobom_6 = 0;
              _radioRegular_6 = 1;
              _radioRuim_6 = 0;
              break;
            case 4:
              _radioMuito_6 = 0;
              _radiobom_6 = 0;
              _radioRegular_6 = 0;
              _radioRuim_6 = 1;
              break;
          }

          /*********Radio 07*********/

          switch (_r7) {
            case 1:
              _radioMuito_7 = 1;
              _radiobom_7 = 0;
              _radioRegular_7 = 0;
              _radioRuim_7 = 0;
              break;
            case 2:
              _radioMuito_7 = 0;
              _radiobom_7 = 1;
              _radioRegular_7 = 0;
              _radioRuim_7 = 0;
              break;
            case 3:
              _radioMuito_7 = 0;
              _radiobom_7 = 0;
              _radioRegular_7 = 1;
              _radioRuim_7 = 0;
              break;
            case 4:
              _radioMuito_7 = 0;
              _radiobom_7 = 0;
              _radioRegular_7 = 0;
              _radioRuim_7 = 1;
              break;
          }

          /*********Radio 08*********/

          switch (_r8) {
            case 1:
              _radioMuito_8 = 1;
              _radiobom_8 = 0;
              _radioRegular_8 = 0;
              _radioRuim_8 = 0;
              break;
            case 2:
              _radioMuito_8 = 0;
              _radiobom_8 = 1;
              _radioRegular_8 = 0;
              _radioRuim_8 = 0;
              break;
            case 3:
              _radioMuito_8 = 0;
              _radiobom_8 = 0;
              _radioRegular_8 = 1;
              _radioRuim_8 = 0;
              break;
            case 4:
              _radioMuito_8 = 0;
              _radiobom_8 = 0;
              _radioRegular_8 = 0;
              _radioRuim_8 = 1;
              break;
          }

          /*********Radio 09*********/

          switch (_r9) {
            case 1:
              _radioMuito_9 = 1;
              _radiobom_9 = 0;
              _radioRegular_9 = 0;
              _radioRuim_9 = 0;
              break;
            case 2:
              _radioMuito_9 = 0;
              _radiobom_9 = 1;
              _radioRegular_9 = 0;
              _radioRuim_9 = 0;
              break;
            case 3:
              _radioMuito_9 = 0;
              _radiobom_9 = 0;
              _radioRegular_9 = 1;
              _radioRuim_9 = 0;
              break;
            case 4:
              _radioMuito_9 = 0;
              _radiobom_9 = 0;
              _radioRegular_9 = 0;
              _radioRuim_9 = 1;
              break;
          }

          /*********Radio 10*********/

          switch (_r10) {
            case 1:
              _radioMuito_10 = 1;
              _radiobom_10 = 0;
              _radioRegular_10 = 0;
              _radioRuim_10 = 0;
              break;
            case 2:
              _radioMuito_10 = 0;
              _radiobom_10 = 1;
              _radioRegular_10 = 0;
              _radioRuim_10 = 0;
              break;
            case 3:
              _radioMuito_10 = 0;
              _radiobom_10 = 0;
              _radioRegular_10 = 1;
              _radioRuim_10 = 0;
              break;
            case 4:
              _radioMuito_10 = 0;
              _radiobom_10 = 0;
              _radioRegular_10 = 0;
              _radioRuim_10 = 1;
              break;
          }
  Avaliacao avaliacao = new Avaliacao( _dataHora, _idCidade, _radioSim_1, _radioNao_1,
                                      _radioMuito_2, _radiobom_2, _radioRegular_2, _radioRuim_2,
                                      _radioSeguro_3, _radioPoucoSeguro_3, _radioInseguro_3,
                                      _radioExcessiva_4, _radioRazoavel_4, _radioInsuficiente_4,
                                      _radioMuito_5, _radiobom_5, _radioRegular_5, _radioRuim_5,
                                      _radioMuito_6, _radiobom_6, _radioRegular_6, _radioRuim_6,
                                      _radioMuito_7, _radiobom_7, _radioRegular_7, _radioRuim_7,
                                      _radioMuito_8, _radiobom_8, _radioRegular_8, _radioRuim_8,
                                      _radioMuito_9, _radiobom_9, _radioRegular_9, _radioRuim_9,
                                      _radioMuito_10,_radiobom_10,_radioRegular_10,_radioRuim_10,
                                      _sugestoes, _tipoAgente, _nomeTipoAgente, _nomeAgente, _cpf);

          //Send Avaliação Json to Server Laravel:
          //AvaliacaoApi().insertJson(avaliacao.toJson(), context);
          _progressDialog = new ProgressDialog(context);
          _progressDialog =  ProgressDialog(context, type: ProgressDialogType.Normal);
          _progressDialog.style(
              message: 'Enviando Avaliação...',
              borderRadius: 10.0,
              backgroundColor: Colors.redAccent,
              progressWidget: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent)
              ),
              elevation: 10.0,
              insetAnimCurve: Curves.elasticIn,
              progress: 0.0,
              maxProgress: 100.0,
              progressTextStyle: TextStyle(
                  color: Colors.black54, fontSize: 10.0, fontWeight: FontWeight.w400),
              messageTextStyle: TextStyle(
                  color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w600)
          );
          _progressDialog.show();
          Future.delayed(Duration(seconds: 4)).then((value){
            AvaliacaoApi().insertJson(avaliacao.toJson(), context);
            _progressDialog.hide();
          });


          //Fim validação 01:
        } else {
          Utils().showDefaultSnackbar(context, "Selecione todos os campos!!!");
        }
        //Fim validação 02:
      } else {
        Utils().showDefaultSnackbar(context, "Digite a Profissão!!!");
      }
      //Fim validação 03:
    } else {
      Utils().showDefaultSnackbar(context, "Selecione a Cidade!!!");
    }
  }
  );

  /*print("Resultado: " + _r1.toString()

      + " -- Cidade: " + _selectedCidade.descricao_cidade
      + " -- Muito: " + a.radioSeguro_3.toString()
      + " -- BOm: " + a.radioPoucoSeguro_3.toString()
      + " -- Regular: " + a.radioInseguro_3.toString()
      + " -- Ruim: " + a.radioInseguro_3.toString()
      + " -- Nome: " + a.nomeAgente.toString()
      + " -- Sugestão: " + a.sugestoes.toString()
      + " -- Cpf: " + _cpf
      + " -- Prof: " + _selectedProfissional.id.toString()


  );*/
  }

  Padding _textoTitulo(String valor){

    Padding texto = Padding(

        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child:


        Container(
          width: 500,
          height: 40,
          alignment: Alignment.center,
          color: Colors.red,
          child: Text(valor,

                style: TextStyle(

                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 05.0,
                  color: Colors.white70,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
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
                    color: Colors.black54,
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
              color: Colors.black54,
              fontSize: 16.0,
              fontWeight: FontWeight.bold
          ),
        )
    );
    return texto;
  }

  getCidades() async{

    DBAvaliacoes db = new DBAvaliacoes();
    List cidade = await db.getCidades();
    List ufs = await db.getUfs();

    print(cidade);
    print("************");
    print(ufs);


    List cidades = await db.getCidadesUfs();
    List<Cidade> listaTemporaria = List<Cidade>();
    for(int i = 0; i < cidades.length; i++){
      Cidade c = Cidade.fromMap(cidades[i]);
      listaTemporaria.add(c);
    }
    setState(() {
      _listaCidades = listaTemporaria;
      _dropdownMenuItemsCidades = buildDropdownMenuItemsCidades(_listaCidades);
      _selectedCidade = _dropdownMenuItemsCidades[0].value;
    });
    listaTemporaria = null;
    print(_listaCidades.toString());

  }

   getProfissionais(){

     List<Profissional> listaTemporaria = [
      Profissional(1, "ESCOLHA UMA OPÇÃO"),
      Profissional(2, "ACS"),
      Profissional(3, "ACE"),
      Profissional(4, "ENFERMEIRO(A)"),
      Profissional(5, "GESTOR MUNICIPAL")
    ];

     setState(() {
       _listaProfissionais = listaTemporaria;
       _dropdownMenuItemsProfissionais = buildDropdownMenuItemsProfissionais(_listaProfissionais);
       _selectedProfissional = _dropdownMenuItemsProfissionais[0].value;
     });
     listaTemporaria = null;

   }
Text _validarTextoDropdownCidade(int id, String texto){

if(id == 1) {
  texto = "ESCOLHA UMA OPÇÃO".toUpperCase();
  return Text(
    texto,
    style: TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.red,
        fontSize: 15.0
    ),);

}else{
  return Text(
    texto,
    style: TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.red,
        fontSize: 15.0
    ),);
    }
  }
}





