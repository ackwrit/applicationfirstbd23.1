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
      children: const [
        Center(
          child: Text("Liste de personne"),
        ),

        Center(
          child: Text("Une carte"),
        ),
        Center(
          child: Text("Une messagerie"),
        ),

      ],
    );
  }





}

