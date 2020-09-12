import 'dart:async';

import 'package:avaliacao_json_novo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Timer(Duration(seconds: 4), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_)=> Home())
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        padding: EdgeInsets.all(60),
        child: Center(
          //child: Image.asset("imagens/avs.jpg"),
          child: SpinKitCubeGrid(
            color: Colors.white70,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}



