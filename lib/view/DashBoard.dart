import 'package:firstapplication/controller/ListPersonne.dart';
import 'package:firstapplication/controller/Mesfavoris.dart';
import 'package:firstapplication/controller/MyCarte.dart';
import 'package:firstapplication/controller/MyCompte.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget{
  String mail;
  String password;
  DashBoard({required String this.mail , required String this.password});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashBoardState();
  }
}

class DashBoardState extends State<DashBoard>{
  int index=0;
  PageController pageIndex = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width/1.5,
        decoration: const BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
        ),
        child : MonCompte()
      ),
      appBar: AppBar(
        title: const Text("Nouvelle page"),
      ),
      body: bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        onTap: (value){
          setState(() {
            index = value;
            pageIndex.jumpToPage(index);
          });
        },
        currentIndex: index,
        items: const  [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Personnes"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove),
              label: "plus"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "plus"
          ),

        ],
      ),
    );
  }


  Widget bodyPage(){
    return PageView(
      onPageChanged: (newValue){
        setState(() {
          index = newValue;
          pageIndex.jumpToPage(newValue);
        });
      },
      controller: pageIndex,
      children: [
        Center(
          child: ListPersonne()
        ),

        Center(
          child: MyCarte(),
        ),
        Center(
          child: MesFavoris(),
        ),

      ],
    );
  }





}

