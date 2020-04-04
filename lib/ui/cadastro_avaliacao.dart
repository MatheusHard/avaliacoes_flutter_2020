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

              /**********RADIO 01**********/
              RadioListTile(
                      title: _textoNormal(Textos().proporcionou_1) ,
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

              /**********RADIO 02**********/

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
                              activeColor: Colors.greenAccent,
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
                          activeColor: Colors.yellowAccent,
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
    //TODO
    int posicao = 1;
    int tipo_profissional = 1;

    Avaliacao a;
    setState(() {
     a = new Avaliacao();
     //TODO
     a.nomeAgente = "Matheus";
     a.cpf = "123";

     //Validação 01:
     if(posicao > 0 ) {
       //Validação 02:
       if (!(a.nomeAgente == "") && !(a.nomeAgente == null)) {
         //Validação 03:
         if (tipo_profissional > 0) {
           //Validação 04:
           if (!(a.cpf == "") && !(a.cpf == null)) {
             //Validação 05:
             if (_r1 > 0 && _r2 > 0) {

               /*********Radio 01*********/

               switch (_r1) {
                 case 1:
                   a.radioSim_1 = 1;
                   a.radioNao_1 = 0;
                   break;
                 case 2:
                   a.radioSim_1 = 0;
                   a.radioNao_1 = 1;
                   break;
               }

               /*********Radio 01*********/

               switch (_r2) {
                 case 1:
                   a.radioMuito_2 = 1;
                   a.radiobom_2 = 0;
                   a.radioRegular_2 = 0;
                   a.radioRuim_2 = 0;
                   break;
                 case 2:
                   a.radioMuito_2 = 0;
                   a.radiobom_2 = 1;
                   a.radioRegular_2 = 0;
                   a.radioRuim_2 = 0;
                   break;
                 case 3:
                   a.radioMuito_2 = 0;
                   a.radiobom_2 = 0;
                   a.radioRegular_2 = 1;
                   a.radioRuim_2 = 0;
                   break;
                 case 4:
                   a.radioMuito_2 = 0;
                   a.radiobom_2 = 0;
                   a.radioRegular_2 = 0;
                   a.radioRuim_2 = 1;
                   break;
               }
               //Fim validação 01:
              }else{
               print("Selecione todos os campos!!!");
             }
             //Fim validação 02:
           }else{
             print("Digite o Cpf!!!");
           }
         //Fim validação 03:
         }else {
           print("Digite qual Profissão!!!");
         }
       //Fim validação 04:
       }else {
       print("Digite o nome do Profissional!!");
      }
     //Fim validação 05:
     }else {
    print("Selecione a Cidade!!!");
    }

    }
      );

    print("Resultado: " + _r1.toString()

        + " -- Muito: "  +a.radioMuito_2.toString()
        + " -- Bom: "  +  a.radiobom_2.toString()
        + " -- Regular: "  + a.radioRegular_2.toString()
        + " -- Ruim : "  +a.radioRuim_2.toString());

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
              color: Colors.black38,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
          ),
        )
    );
    return texto;
  }
}
