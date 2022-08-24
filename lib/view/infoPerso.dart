import 'package:firstapplication/model/Utilisateur.dart';
import 'package:firstapplication/services/FirestoreHelper.dart';
import 'package:firstapplication/services/constants.dart';
import 'package:firstapplication/view/Messagerie.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isFavori = MyAccount.favoris.contains(widget.utilisateur.id);
    });
  }
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
                    bool tempo = MyAccount.favoris.contains(widget.utilisateur.id);
                  if(!tempo){
                    MyAccount.favoris.add(widget.utilisateur.id);
                    Map<String,dynamic> map ={
                      "FAVORIS" : MyAccount.favoris
                    };
                    FirestoreHelper().updateUser(MyAccount.id, map);
                  }



            }, icon: Icon(Icons.heart_broken_sharp,size: 45,color:(isFavori)?Colors.red:Colors.black)
            ),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return Messagerie(partenaire: widget.utilisateur);
                  }
              ));

            }, icon: const Icon(Icons.chat_bubble,size: 45,)
            ),

          ],
        )

      ],
    );
  }

}