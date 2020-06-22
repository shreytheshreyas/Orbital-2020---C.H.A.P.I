import "package:flutter/material.dart";


class CreateAccountPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(children:[
                  Container(width: double.infinity, height: 50,),  
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

                  Center(
                    child: RaisedButton(
                            child: Text("Login",
                            style: TextStyle(
                            color: Colors.white, 
                            fontSize: 24
                            )
                          ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Center(child:Text("Hi there this is going to be our home screen"))));
                            }, 
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            elevation: 5.0,
                            color: Colors.green[400],
                            padding: EdgeInsets.only(left: 75, right: 75, top: 20, bottom: 20),    
                    )
                  )  
      ],)
    );
  }
}