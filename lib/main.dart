import "package:flutter/material.dart";

import './TitleScreen.dart';

void main()=>runApp(MyApp());


class MyApp extends StatefulWidget{

  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp>{

  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Project Peace",
      home: Scaffold(
        //appBar: AppBar(title: Text("MyApp")),
        body: TitleScreen()
        ,//icon made by freepick from www.flaticon.com,Icons made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
      )
    );    
  }
}