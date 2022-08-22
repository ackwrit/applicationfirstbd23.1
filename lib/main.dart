import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variable
  late String mail;
  late String password;


  //fonction interne à la page
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: bodyPage()

    );
  }


  Widget bodyPage(){
    return  Column(
      children: [
        const SizedBox(height: 10,),
        TextField(
          onChanged: (value){
            setState(() {
              mail = value;
            });

          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: "Entrer votre adresse mail",
            border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
        ),
        const SizedBox(height: 10,),
        TextField(
          obscureText: true,
          onChanged: (value){
            setState(() {
              password = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre mot de passe",
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
            onPressed: (){

            },
            child: const Text("Connexion"),
        ),
        TextButton(
            onPressed: (){

            },
            child: Text("Inscription")
        ),
      ],
    );
  }
}
