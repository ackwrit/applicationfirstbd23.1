import 'package:firstapplication/model/Utilisateur.dart';
import 'package:flutter/material.dart';

class InfoPerso extends StatefulWidget{
  Utilisateur utilisateur;
  InfoPerso({required this.utilisateur});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoPersoState();
  }

}

class InfoPersoState extends State<InfoPerso>{
  //Variable
  bool isFavori = false;


  //fonction interne
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.utilisateur.pseudo),
        centerTitle: true,

      ),
      body: Center(child: bodyPage()),
    );
  }


  Widget bodyPage(){
    return Column(
      children: [
        const SizedBox(height: 10,),
        //avatar
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(widget.utilisateur.avatar!),
        ),
        //Pseuodo
        Text(widget.utilisateur.pseudo,style: const TextStyle(fontSize: 35,color: Colors.purple,fontWeight: FontWeight.bold),),

        //adresse mail
        Text(widget.utilisateur.mail),

        //Nom et prénom
        Text(widget.utilisateur.fullName),

        //deux boutons en ligne
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: (){
                  setState((){
                    isFavori = true;
                  });



            }, icon: Icon(Icons.heart_broken_sharp,size: 45,color:(isFavori)?Colors.red:Colors.black)
            ),
            IconButton(onPressed: (){

            }, icon: const Icon(Icons.chat_bubble,size: 45,)
            ),

          ],
        )

      ],
    );
  }

}