import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import './custom_dialog.dart';
import 'package:flutter/rendering.dart';
//import 'package:simple_animations/simple_animations.dart';
import './faded_animations.dart';



class FirstView extends StatelessWidget {
  final primaryColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: _width,
        height: _height,
        //color: primaryColor,
        decoration: BoxDecoration(gradient: LinearGradient(begin:Alignment.bottomCenter, colors: [Colors.indigo,Colors.blue,Colors.blue[200], Colors.grey[200], Colors.white])),
        child: Stack(
                  children: <Widget>[ 
            //  Positioned(
            //       top: -50,
            //       left: 0,
            //       child: FadeAnimation(
            //           1,
            //           Container(
            //             width: _width,
            //             height: 400,
            //             decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                     image: AssetImage('assets/one_1.png'),
            //                     fit: BoxFit.cover)),
            //           )),
            //     ),
            //     Positioned(
            //       top: -100,
            //       left: 0,
            //       child: FadeAnimation(
            //           1.3,
            //           Container(
            //             width: _width,
            //             height: 400,
            //             decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                     image: AssetImage('assets/one_1.png'),
            //                     fit: BoxFit.cover)),
            //           )),
            //     ),
            //     Positioned(
            //       top: -150,
            //       left: 0,
            //       child: FadeAnimation(
            //           1.6,
            //           Container(
            //             width: _width,
            //             height: 400,
            //             decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                     image: AssetImage('assets/one_1.png'),
            //                     fit: BoxFit.cover)),
            //           )),
            //     ),
            SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: _height * 0.05),
                  FadeAnimation(
                    0.2,
                      Container(alignment:Alignment.topCenter ,child:Image.asset("images/mental.png", width: 200, height: 200,color: Colors.green[400])
                    ),
                  ),
                  SizedBox(height: _height * 0.05),
                  FadeAnimation(
                    0.4,
                      AutoSizeText(
                      "C.H.A.P.I",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.green,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),

                  SizedBox(height: _height * 0.08),
                  
                  FadeAnimation(
                    0.6,
                     RaisedButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 15.0, left: 30.0, right: 30.0),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          
                          ),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "Would you like to create a free account?",
                            description:
                                "With an account, your data will be securely saved, allowing you to access it from multiple devices.",
                            primaryButtonText: "Create My Account",
                            primaryButtonRoute: "/signUp",
                            secondaryButtonText: "Maybe Later",
                            secondaryButtonRoute: "/home",
                          ),
                        );
                      },
                      elevation: 10.0,
                    ),
                  ),

                  SizedBox(height: _height * 0.02),
                  
                  FadeAnimation(
                     0.8,
                     RaisedButton(
                      color: Colors.green,
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                       shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),          
                       padding: 
                        EdgeInsets.only(top: 15.0, bottom: 15.0, left: 110.0, right: 110.0),           
                       
                       onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/signIn');
                      },
                      elevation: 10.0,
                    ),
                  ),
                  SizedBox(height: _height * 0.02),
                  
                  /*FadeAnimation(
                     1.0,
                     RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        "About Us",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                       shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),          
                       padding: 
                        EdgeInsets.only(top: 15.0, bottom: 15.0, left: 95.0, right: 95.0),           
                       
                       onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Center(child: Text("Application Beta 1.0"))));
                      },
                      elevation: 10.0,
                    )
                  ),*/
                ],
              ),
            ),
          ),
                  ]
        ),
      ),
    );
  }
}