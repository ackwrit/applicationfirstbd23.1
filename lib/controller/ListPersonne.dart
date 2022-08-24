import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplication/model/Utilisateur.dart';
import 'package:firstapplication/services/FirestoreHelper.dart';
import 'package:firstapplication/services/constants.dart';
import "package:flutter/material.dart";

class ListPersonne extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListPersonneState();
  }

}

class ListPersonneState extends State<ListPersonne>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }



  Widget bodyPage(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper().fireUsers.snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            //La base de donnée n'a aucun snapshot
            return const Center(
              //Widget en forme de cercle qui tourne sur lui meme en permance
              child: CircularProgressIndicator()
            );


          }
          else
            {
              //La base de donnée a un ou plusieurs snapshots
              List documents = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context,index){
                   Utilisateur personne = Utilisateur(documents[index]);
                   if(MyAccount.id != personne.id){
                     return Card(
                       elevation: 5,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                       child:  ListTile(
                         leading: CircleAvatar(
                           radius: 25,
                           backgroundImage: NetworkImage(personne.avatar!),
                         ),
                         title: Text(personne.pseudo),
                         subtitle: Text(personne.fullName),


                       ),
                     );
                   }
                   else
                     {
                       return Container();
                     }

                  }
              );


            }
        }
    );
  }

}