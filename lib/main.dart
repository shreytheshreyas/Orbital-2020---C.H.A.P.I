// import "package:flutter/material.dart";

// import './TitleScreen.dart';

// void main()=>runApp(MyApp());


// class MyApp extends StatefulWidget{

//   State<StatefulWidget> createState() => MyAppState();
// }

// class MyAppState extends State<MyApp>{

//   Widget build(BuildContext context) {

//     return MaterialApp(
//       title: "Project Peace",
//       home: Scaffold(
//         //appBar: AppBar(title: Text("MyApp")),
//         body: TitleScreen()
//         ,//icon made by freepick from www.flaticon.com,Icons made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
//       )
//     );    
//   }
// }

import 'package:flutter/material.dart';
import './auth_service.dart';
import './sign_up_view.dart';
import './first_view.dart';
import './provider_widget.dart';
import './HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
          auth: AuthService(),
          child: MaterialApp(
            title: 'Peace',
            home: HomeController(),
            routes: <String, WidgetBuilder>{
            '/signUp' : (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
            '/signIn' : (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
            '/home'   : (BuildContext context)  => HomeController(),
            }
          ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if(snapshot.connectionState == ConnectionState.active){
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomePage() : FirstView();
        }
        return CircularProgressIndicator();
      },
      );
  }
}


