import 'package:AppUI/CreateAccount.dart';
import 'package:AppUI/Login.dart';
import "package:flutter/material.dart";

import'./Login.dart';
import'./CreateAccount.dart';
import'./AboutUs.dart';

class TitleElement extends StatelessWidget{
  final String  elementTitle;
  final Color elementColor;
  final double leftPadding;
  final double rightPadding;    

  TitleElement(this.elementTitle,this.elementColor,this.leftPadding,this.rightPadding);

  @override
  Widget build(BuildContext context) {

  return Center(
       child:RaisedButton(
              child:Text(elementTitle, 
                    style: TextStyle(
                    color: Colors.white, 
                    fontSize: 24)
              ),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ElementStates(elementTitle)));
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 5.0,
              color: elementColor,
              padding: EdgeInsets.only(left: leftPadding, right: rightPadding, top: 20, bottom: 20)
          ), 
      );
  }
}

class ElementStates extends StatelessWidget{
  final String titleState;
  
  ElementStates(this.titleState);

  @override
  Widget build(BuildContext context) {
    if(titleState == "Login")
      return LoginPage();

    if(titleState == "Create Account")
      return CreateAccountPage();

    if(titleState == "About Us")
      return AboutUs();  

    return Text("Facing Techinical issues");
  }

}