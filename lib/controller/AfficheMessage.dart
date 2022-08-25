import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplication/model/Message.dart';
import 'package:firstapplication/services/FirestoreHelper.dart';
import 'package:flutter/material.dart';

class AfficheMessage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AfficheMessageState();
  }

}

class AfficheMessageState extends State<AfficheMessage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }


  Widget bodyPage(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper().fireMessage.orderBy("DATE",descending: true).snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else
            {
              List documents = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context,index){
                    Message message = Message(documents[index]);
                    return Text(message.texte);
                  }
              );
            }
          
        }
    );
  }




}