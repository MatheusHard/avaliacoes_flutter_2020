


class Utils {


   static final String URL_WEB_SERVICE = "http://192.168.1.5:8000/";

   static final int CONNECTION_TIMEOUT = 10000;
   static final int READ_TIMEOUT = 15000;

   static final int TIPO_ACS = 1;
   static final int TIPO_ACE = 2;

   static final String ACE = "_ACE";
   static final String ACS = "_ACS";
   static String AGENTE = "";


  /*******validar Cpf********/

   /*static bool isCPF(String CPF) {

    // considera-se erro CPF's formados por uma sequencia de numeros iguais
    if (CPF == "00000000000" ||
        CPF == "11111111111" ||
        CPF == "22222222222" || CPF == "33333333333" ||
        CPF == "44444444444" || CPF == "55555555555" ||
        CPF == "66666666666" || CPF == "77777777777" ||
        CPF == "88888888888" || CPF == "99999999999" ||
        (CPF.length != 11))
      return(false);

    char dig10, dig11;
    int sm, i, r, num, peso;

    // "try" - protege o codigo para eventuais erros de conversao de tipo (int)
    try {
      // Calculo do 1o. Digito Verificador
      sm = 0;
      peso = 10;
      for (i=0; i<9; i++) {
        // converte o i-esimo caractere do CPF em um numero:
        // por exemplo, transforma o caractere '0' no inteiro 0
        // (48 eh a posicao de '0' na tabela ASCII)
        num = (int)(CPF.charAt(i) - 48);
        sm = sm + (num * peso);
        peso = peso - 1;
      }

      r = 11 - (sm % 11);
      if ((r == 10) || (r == 11))
        dig10 = '0';
      else dig10 = (char)(r + 48); // converte no respectivo caractere numerico

      // Calculo do 2o. Digito Verificador
      sm = 0;
      peso = 11;
      for(i=0; i<10; i++) {
        num = (int)(CPF.charAt(i) - 48);
        sm = sm + (num * peso);
        peso = peso - 1;
      }

      r = 11 - (sm % 11);
      if ((r == 10) || (r == 11))
        dig11 = '0';
      else dig11 = (char)(r + 48);

      // Verifica se os digitos calculados conferem com os digitos informados.
      if ((dig10 == CPF.charAt(9)) && (dig11 == CPF.charAt(10)))
        return(true);
      else return(false);
    } catch (InputMismatchException erro) {
    return(false);
    }
  }*/

   static String imprimeCPF(String CPF) {
    return(CPF.substring(0, 3) + "." + CPF.substring(3, 6) + "." +
        CPF.substring(6, 9) + "-" + CPF.substring(9, 11));
  }

/**************************************************************************************/





}