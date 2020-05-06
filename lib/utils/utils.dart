import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:flutter/material.dart';

class Utils {

   String URL_WEB_SERVICE = "http://10.0.10.106:8000/";

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


