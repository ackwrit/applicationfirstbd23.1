import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firstapplication/services/constants.dart';
import 'package:flutter/material.dart';

class MonCompte extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MonCompteState();
  }
  
}

class MonCompteState extends State<MonCompte>{
  //Variable
  Uint8List? dataImage;
  String? nameImage;
  String? cheminImage;



  //fonctions internes
  selectionImage() async{
    FilePickerResult? resultat = await FilePicker.platform.pickFiles(
      withData: true
    );
    if(resultat !=null){
      dataImage = resultat.files.first.bytes;
      nameImage = resultat.files.first.name;
      await showImage();
      Navigator.pop(context);
    }
  }


  showImage(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text("Choix de l'image"),
            content: Image.memory(dataImage!),
            actions: [
              TextButton(
                  onPressed: (){
                Navigator.pop(context);
              },
                  child: const Text("Annuler")
              ),
              TextButton(
                  onPressed: (){

              },
                  child: const Text("Enregistrer")
              ),
            ],

          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
          child: bodyPage()
      ),
    );
  }


  Widget bodyPage(){
    return Column(
      children: [
        //Avatar cliqubale
        InkWell(
          child: CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(MyAccount.avatar!),
          ),
          onTap: (){
            print("J'ai cliquer l'image");
            selectionImage();
          },
        ),


        //Pseudo
        Text(MyAccount.pseudo,style: const TextStyle(fontSize: 35,color: Colors.purple,fontWeight: FontWeight.bold),),

        //adresse mail
        Text(MyAccount.mail),

        //Nom et prénom
        Text(MyAccount.fullName),


      ],
    );
  }
  
}