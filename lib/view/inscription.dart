import 'package:flutter/material.dart';

class Inscription extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InscriptionState();
  }

}

class InscriptionState extends State<Inscription>{
  //varibales
  late String pseudo;
  late String mail;
  late String password;
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Padding(
        child: bodyPage(),
        padding: const EdgeInsets.all(15)
      )

    );
  }


  Widget bodyPage(){

    return Column(
      children: [
        //Pseudo
        TextField(
          onChanged: (value){
            setState(() {
              pseudo = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre pseudo",
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
        ),


        //mail


        //password


        //bouton de la date de naissance
      ],

    );
  }

}