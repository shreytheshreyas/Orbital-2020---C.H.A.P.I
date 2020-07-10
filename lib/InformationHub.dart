import "package:flutter/material.dart";

class InformationHub extends StatelessWidget{

Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text("Information Hub")),
    body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(gradient: LinearGradient(begin:Alignment.topCenter, colors: [Colors.white,Colors.blue[200],],),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          RaisedButton(child: Text("Hospital and Clinical Services", style: TextStyle(fontSize: 20.0,),), 
          color: Colors.indigo[400],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),          
          padding: EdgeInsets.only(left:95, right: 95, top: 80, bottom: 80),
          onPressed:  () { Navigator.push(context, MaterialPageRoute(builder: (context) => Text('Hello', style: TextStyle(fontSize: 36.0))));}
          ),

          SizedBox(height: 50),          
          
          RaisedButton(child: Text("Hotlines", style: TextStyle(fontSize: 20.0)), 
          color: Colors.red[400],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.only(top: 85,bottom: 85,right: 155,left: 155),
          onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Text('Hello', style: TextStyle(fontSize: 36.0))));}
          ,)
        ]
      )
    )
  );
}
}