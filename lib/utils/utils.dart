import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:flutter/material.dart';

class Utils {

   //String URL_WEB_SERVICE = "http://192.168.1.9:8000/";
  String URL_WEB_SERVICE = "http://avaliacoes-backend.herokuapp.com/";

   /**************Validar Cpf**************/

   String imprimeCPF(String cpf){
    return CPF().format(cpf);
    }
    bool validarCPF(String cpf){
    return CPF().isValid(cpf);
    }

    /**************Mostrar Texto**************/

    void showDefaultSnackbar(BuildContext context, String texto) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(texto),
          action: SnackBarAction(
            label: 'Click Me',
            onPressed: () {},
          ),
        ),
      );
    }
  }


