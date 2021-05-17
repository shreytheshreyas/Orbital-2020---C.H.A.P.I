import "package:flutter/material.dart";


class AboutUs extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: ListView(
        children: [
         Container(child: Text("Creators", style: TextStyle(fontSize: 20)), alignment: Alignment.center, decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(200)), padding: EdgeInsets.all(40), margin: EdgeInsets.all(20),),
         Container(child: Row(children: [Container(margin: EdgeInsets.all(10),child: Image.asset("images/shreyas.png", height : 200, width: 215), foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),), SizedBox(width: 10), Text("Shreyas Kumar", style: TextStyle(fontSize: 20))] ), decoration: BoxDecoration(),),
         SizedBox(height: 30),
         Container(child: Row(children: [Container(margin: EdgeInsets.all(15),child: Image.asset("images/Nagi.jpg", height: 200, width: 195)), SizedBox(width: 20), Text("Nagi Teja", style: TextStyle(fontSize: 20))] )),
        // Container(),
        // Container(),
        // Container(),
        // Container(),
        // Container(), 
        ]
      ),
    );
  }
}