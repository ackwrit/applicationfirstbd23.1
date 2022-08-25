import 'package:firstapplication/model/Utilisateur.dart';
import 'package:firstapplication/services/FirestoreHelper.dart';
import 'package:firstapplication/services/constants.dart';
import 'package:firstapplication/view/infoPerso.dart';
import 'package:flutter/material.dart';

class MesFavoris extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MesFavorisState();
  }

}

class MesFavorisState extends State<MesFavoris>{
  //Variable
  List <Utilisateur> personnesFavori = [];

@override
void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0;i<MyAccount.favoris.length;i++){
        FirestoreHelper().getUsers(MyAccount.favoris[i]).then((value){
          setState((){
            personnesFavori.add(value);
          });

        });
      }


  }






  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return bodyPage();
  }


  Widget bodyPage() {

    return GridView.builder(
      padding: EdgeInsets.all(10),
        itemCount: personnesFavori.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,),
        itemBuilder: (context,index) {
          Utilisateur favoriPersonne = personnesFavori[index];

          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return InfoPerso(utilisateur: favoriPersonne);
                  }
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(favoriPersonne.avatar!)
                )
              ),
              child:Center(
                child: Text(favoriPersonne.pseudo,style: const TextStyle(color: Colors.purple,fontSize: 30,fontWeight: FontWeight.bold),),
              )

            ),
          );

        }
    );
  }

}