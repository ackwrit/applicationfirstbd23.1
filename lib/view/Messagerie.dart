import 'package:firstapplication/controller/AfficheMessage.dart';
import 'package:firstapplication/controller/ZoneTexte.dart';
import 'package:firstapplication/model/Utilisateur.dart';
import 'package:firstapplication/services/constants.dart';
import 'package:flutter/material.dart';

class Messagerie extends StatefulWidget{
  Utilisateur partenaire;
  Messagerie({required this.partenaire});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessagerieState();
  }

}

class MessagerieState extends State<Messagerie>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: bodyPage(),
    );
  }


  Widget bodyPage(){
    return Column(
      children: [
        //Texte qui sera afficher
        Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height,
              //Afficher les messages
              child: AfficheMessage(moi:MyAccount,partenaire: widget.partenaire),
            )
        ),

        Divider(),

        //Zone de texte
        ZoneTexte(moi: MyAccount,partenaire: widget.partenaire)

      ],
    );
  }

}