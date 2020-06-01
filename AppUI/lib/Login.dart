import "package:flutter/material.dart";


class LoginPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(children:[
                  Container(width: double.infinity, height: 20,),  
                  Text("UserName"),
                  Container(width: 303, height: 58, decoration: BoxDecoration(border: Border.all(width: 2.0, color: Colors.blue)),),
                  Text("Password"),
                  Container(width: 303, height: 58, decoration: BoxDecoration(border: Border.all(width: 2.0, color: Colors.blue)),),
      ],)
    );
  }
}