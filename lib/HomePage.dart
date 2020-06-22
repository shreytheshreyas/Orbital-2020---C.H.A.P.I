import "package:flutter/material.dart";

import './HomePageApplication.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    //List<String> featureImages = ["images/bot.png","images/headphones.png","images/growth.png","images/book.png","images/gear.png","images/description.png"];
    //List<String> featureNames = ["ChatBot", "Music", "Progress Tracker", "Story Teller", "Progress Settings", "Information Hub"];
      Map <String, List> features = {
                    "f1": ["images/bot.png","ChatBot", Colors.red[400]],
                    "f2": ["images/headphones.png","Music", Colors.amber[800]],
                    "f3": ["images/growth.png", "Progress\nTracker",Colors.green[400]],
                    "f4": ["images/book.png", "Story\nTeller", Colors.indigo[700]],
                    "f5": ["images/gear.png", "Progress\nSettings", Colors.yellow[700]],
                    "f6": ["images/description.png","Information\nHub", Colors.white]
                    };

    return Scaffold(
      body: Column(children: [
        Container(width: double.infinity, height: 80),
        Row(children: [Container(width: 15), HomePageApplication(features["f1"][0],features["f1"][1],features["f1"][2]), Container(width: 15), HomePageApplication(features["f2"][0],features["f2"][1],features["f3"][2]), Container(width: 10)],),
        Container(width: double.infinity, height: 30),
        Row(children: [Container(width: 15), HomePageApplication(features["f3"][0],features["f3"][1],features["f3"][2]), Container(width: 15), HomePageApplication(features["f4"][0],features["f4"][1],features["f4"][2]), Container(width: 10)], ),
        Container(width: double.infinity, height: 30),
        Row(children: [Container(width: 15), HomePageApplication(features["f5"][0],features["f5"][1],features["f5"][2]),Container(width: 15), HomePageApplication(features["f6"][0],features["f6"][1],features["f6"][2]), Container(width: 10)],),
      ],
      ),
    );
  }
}