import 'package:firstapplication/model/Message.dart';
import 'package:firstapplication/model/Utilisateur.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatefulWidget{
  Message message;
  Utilisateur partenaire;
  String monId;
  MessageBubble({required this.message,required this.partenaire,required this.monId});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageBubbleState();
  }


}

class MessageBubbleState extends State<MessageBubble>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }


  Widget bodyPage(){
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: widgetBubble(widget.message.from == widget.monId),
      ),

    );
  }

  List<Widget> widgetBubble(bool moi){
    CrossAxisAlignment alignment = moi? CrossAxisAlignment.end : CrossAxisAlignment.start;
    Color colorBubble = moi ? Colors.green : Colors.blue;
    Color textColor = Colors.white;
    return <Widget>[
      Expanded(
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: colorBubble,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(widget.message.texte,style: TextStyle(color: textColor),),
                ),
              ),
            ],
          ),
      )
    ];
  }




}