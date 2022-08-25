import 'package:firstapplication/model/Utilisateur.dart';
import 'package:firstapplication/services/FirestoreHelper.dart';
import 'package:flutter/material.dart';

class ZoneTexte extends StatefulWidget{
  Utilisateur moi;
  Utilisateur partenaire;
  ZoneTexte({required this.moi, required this.partenaire});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ZoneTexteState();
  }

}

class ZoneTexteState extends State<ZoneTexte>{
  //Varibale
  TextEditingController controller = TextEditingController();



  //fonction interne
  sendMessage(){

    if(controller != null && controller != ""){
      String texte = controller.text;
      //Enregister dans la base de donnée
      FirestoreHelper().EnvoiMessage(texte, widget.moi, widget.partenaire);
      //effacer le texte
      controller.clear();
      //Fermer le clavier
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration.collapsed(
                    hintText: "Ecrivez votre message"
                ),
                maxLines: null,
              ),
          ),
          IconButton(
              onPressed: (){
                sendMessage();
              }, 
              icon: const Icon(Icons.send)
          )
        ],
      ),

    );
  }

}