import 'package:AppUI/AboutUs.dart';
import 'package:AppUI/InformationHub.dart';
import "package:flutter/material.dart";
import './auth_service.dart';
import './provider_widget.dart';
import './HomePageApplication.dart';
import './dialogFlow.dart';
import './Music_Feature.dart';
//import './InformationHub.dart';
import './HospitalList.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    //List<String> featureImages = ["images/bot.png","images/headphones.png","images/growth.png","images/book.png","images/gear.png","images/description.png"];
    //List<String> featureNames = ["ChatBot", "Music", "Progress Tracker", "Story Teller", "Progress Settings", "Information Hub"];
      CharlieTheChatBot applicationChatBot = new CharlieTheChatBot();
      MusicFeature applicationMusicFeature = new MusicFeature(); 
      HospitalInfo informationHubFeature = new HospitalInfo();
      AboutUs aboutUsFeature = new AboutUs();

      Map <String, List> features = {
                    "f1": ["images/bot.png","ChatBot", Colors.red[400],applicationChatBot],
                    "f2": ["images/headphones.png","Music", Colors.amber[800],applicationMusicFeature],
                    "f3": ["images/gear.png", "About Us", Colors.blue,aboutUsFeature],
                    "f4": ["images/book.png","Seek Help", Colors.white,informationHubFeature]
                    };

    return Scaffold(
      appBar: AppBar(title: Center(child:Text("Home Page", style: TextStyle(fontSize: 24))),),
      body: Container(
       decoration: BoxDecoration(gradient: LinearGradient(begin:Alignment.topCenter, colors: [Colors.white,Colors.blue[200],],),),
        child: Column(children: [
        Container(width: double.infinity, height: 20),
        Row(children: [Container(width: 15), HomePageApplication(features["f1"][0],features["f1"][1],features["f1"][2],features["f1"][3]), Container(width: 15)],),
        Container(width: double.infinity, height: 10),
        Row(children: [Container(width: 15), HomePageApplication(features["f2"][0],features["f2"][1],features["f2"][2],features["f2"][3]), Container(width: 10)],),
        Container(width: double.infinity, height: 10),
        Row(children: [Container(width: 15), HomePageApplication(features["f4"][0],features["f4"][1],features["f4"][2],features["f4"][3]), Container(width: 10)],),
        Container(width: double.infinity, height: 10),
        RaisedButton(child: Container(child: Text("Sign Out", style: TextStyle(fontSize: 24),)),
                   color: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.only(top: 30, bottom: 30, left : 40, right: 40),
                    elevation: 5.0,
                   onPressed: () async {
                    try{
                        AuthService auth = Provider.of(context).auth;
                        await auth.signOut();
                        print("Signed Out");
                    } catch (e){
                    print(e);
                  }
                },
            ),
      ],
      ),
    )
    );
  }
}