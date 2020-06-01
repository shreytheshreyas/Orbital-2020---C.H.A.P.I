import "package:flutter/material.dart";


class CreateAccountPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(children:[
                  Container(width: double.infinity, height: 20,),  
                  Text("Cerate UserName"),
                  Container(width: 303, height: 58, decoration: BoxDecoration(border: Border.all(width: 2.0, color: Colors.blue)),),
                  Container(width: double.infinity, height: 20,),                   
                  Text("Confirm UserName"),
                  Container(width: 303, height: 58, decoration: BoxDecoration(border: Border.all(width: 2.0, color: Colors.blue)),),
                  Container(width: double.infinity, height: 20,), 
                  Text("Create Password:"),
                  Container(width: 303, height: 58, decoration: BoxDecoration(border: Border.all(width: 2.0, color: Colors.blue)),),
                  Container(width: double.infinity, height: 20,),
                  Text("Confim Password"), 
                  Container(width: 303, height: 58, decoration: BoxDecoration(border: Border.all(width: 2.0, color: Colors.blue)),),
                  Container(width: double.infinity, height: 20,),                                                      
      ],)
    );
  }
}