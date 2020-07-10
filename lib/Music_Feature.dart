import 'package:flutter/material.dart';

import './instrumental_page.dart';
import './jungle_path.dart';
import './music_widgets.dart';
import './naps_page.dart';
import './oceans_page.dart';

class MusicFeature extends StatefulWidget {
  @override
  _MusicFeature createState() => _MusicFeature();
}

class _MusicFeature extends State<MusicFeature> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[300],
              Colors.blue[200],
            ]
            )
        ),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                      bottomLeft: const Radius.circular(40.0),
                      bottomRight: const Radius.circular(40.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.05)
                      ]
                    )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(0.2),
                              Colors.black.withOpacity(0.1),
                            ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Music',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          "To Improve your sleep",
                          style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(15.0),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10.0,
                      children: [
                        MusicWidgets(
                            'NagiMusicAssets/picture1.jpg', 'Power Naps', Naps()),
                        MusicWidgets(
                            'NagiMusicAssets/picture2.jpg', 'Jungle', JungleAudio()),
                        MusicWidgets(
                            'NagiMusicAssets/picture3.jpg', 'Ocean', OceansAudio()),
                        MusicWidgets(
                            'NagiMusicAssets/picture4.jpg', 'Instrumental', InstrumentalAudio()),
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}
