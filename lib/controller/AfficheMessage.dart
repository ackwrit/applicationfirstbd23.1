import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplication/controller/MessageBubble.dart';
import 'package:firstapplication/model/Message.dart';
import 'package:firstapplication/model/Utilisateur.dart';
import 'package:firstapplication/services/FirestoreHelper.dart';
import 'package:flutter/material.dart';

class AfficheMessage extends StatefulWidget{
  Utilisateur moi;
  Utilisateur partenaire;
  AfficheMessage({required this.moi, required this.partenaire});
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
        stream: FirestoreHelper().fireMessage.orderBy("DATE",descending: false).snapshots(),
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
                    if(message.from == widget.moi.id && message.to == widget.partenaire.id || message.from == widget.partenaire.id && message.to == widget.moi.id){
                      return MessageBubble(message: message, partenaire: widget.partenaire, monId: widget.moi.id);
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