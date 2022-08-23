import 'package:flutter/material.dart';

class MonCompte extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MonCompteState();
  }
  
}

class MonCompteState extends State<MonCompte>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child: bodyPage()
      ),
    );
  }


  Widget bodyPage(){
    return const Text("coucouic");
  }
  
}