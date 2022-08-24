import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplication/services/FirestoreHelper.dart';
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
                    return const Text("Image");
                  }
              );


            }
        }
    );
  }

}