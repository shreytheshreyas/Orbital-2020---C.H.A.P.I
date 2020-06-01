import"package:flutter/material.dart";

import './TitleElement.dart';


class TitleScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var titleElements = ["Login","Create Account","About Us"];
    return Column(children:[
                 Container(width: double.infinity, height: 70),
                  Container(alignment:Alignment.topCenter ,child:Image.asset("images/mental.png", width: 200, height: 200,color: Colors.green[400])),
                  Container(width: double.infinity, height: 100),
                  TitleElement(titleElements[0],Colors.green[400],75,75),
                  Container(width: double.infinity, height: 20,),                  
                  TitleElement(titleElements[1],Colors.blue[300],20,20),
                  Container(width: double.infinity, height: 20),                 
                  TitleElement(titleElements[2],Colors.red,55,55)
      ]);
  }
}