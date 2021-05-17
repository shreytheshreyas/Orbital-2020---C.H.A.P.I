import "package:flutter/material.dart";


class HomePageApplication extends StatelessWidget{
  final String imageName;
  final String featureName;
  final Color featureColor;
  final Widget associatedFeature;
  //final int featureTextSize;
  
  HomePageApplication(this.imageName,this.featureName,this.featureColor,this.associatedFeature);

  @override
  Widget build(BuildContext context) {
    return //Column(children: [
        //Row(children:[\
          RaisedButton(
            child: Container(child: Column(children: [Image.asset(imageName, width: 290, height: 100,color: Colors.black), Text(featureName, style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,),]),padding: EdgeInsets.all(20)), 
            onPressed: () 
            { Navigator.push(context, MaterialPageRoute(builder: (context) => associatedFeature));},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: featureColor,
            );
        //])
        //]);
  }
}