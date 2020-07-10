import 'package:flutter/material.dart';

class MusicWidgets extends StatelessWidget {
  final String image;
  final String text;
  final StatefulWidget page;

  MusicWidgets(this.image,this.text,this.page);

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                   borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0),
                    ),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                      bottomLeft: const Radius.circular(40.0),
                      bottomRight: const Radius.circular(40.0),

                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      Center(
                        child: Text(
                          text,
                          style: TextStyle(
                             fontSize: 25.0,
                             color: Colors.white,
                             fontStyle: FontStyle.italic,
                             fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      IconButton(
                        icon: Icon(Icons.music_note),
                        color: Colors.white,
                        highlightColor: Colors.white,
                        iconSize: 30.0, 
                        onPressed: (){
                          Navigator.push(context, new MaterialPageRoute(builder: (context) => page));
                        })
                    ],
                    ),
                ),
              );
  }
}



