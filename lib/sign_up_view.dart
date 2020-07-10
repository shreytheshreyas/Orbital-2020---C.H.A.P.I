
import 'package:AppUI/first_view.dart';
import 'package:flutter/material.dart';
import './auth_service.dart';
import './provider_widget.dart';


final primaryColor = Colors.blue;
enum AuthFormType {signIn, signUp, reset}

class SignUpView extends StatefulWidget {

  final AuthFormType authFormType;
  SignUpView({ Key key, @required this.authFormType}) : super(key: key);
  @override
  _SignUpViewState createState() => _SignUpViewState(authFormType: this.authFormType);
}

class _SignUpViewState extends State<SignUpView> {
    AuthFormType authFormType;
   _SignUpViewState({this.authFormType});

  final formKey = GlobalKey<FormState>();
  String _email, _password, _name, _warning;

  void switchFormState( String state) {
    formKey.currentState.reset();
    if(state == "signUp"){
      setState(() {
        authFormType = AuthFormType.signUp;
      });
    } else{
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }
  }

  bool validate() {
    final form = formKey.currentState;
    form.save();
    if(form.validate()) {
      form.save();
      return true;
    }else{
      return false;
    }
  }

  void submit() async {
    if(validate()) {
    try {
      final auth = Provider.of(context).auth;
    if(authFormType == AuthFormType.signIn){
      String uid = await auth.signInWithEmailAndPassword(_email, _password);
      print("Signed In with ID $uid");
      Navigator.of(context).pushReplacementNamed('/home');
    } else if (authFormType == AuthFormType.reset) {
      await auth.sendPasswordResetEmail(_email);
      print("Password reset email sent");
      _warning = "A password reset link has been sent to $_email";
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }   
    else {
      String uid = await auth.createUserWithEmailAndPassword(_email, _password, _name);
      print("Signed up with New ID $uid");
      Navigator.of(context).pushReplacementNamed('/home');
    }

    }catch (e) {
      setState(() {
        _warning = e.message;
      });
      print(e);
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin:Alignment.topCenter, colors: [
            Colors.white,
            Colors.blue[200],

          ], ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              IconButton(icon: Icon(Icons.arrow_back),alignment: Alignment(0.0,0.0), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => FirstView())); }), 
              //!!!!!!!!!!!!!!!!!!!!!!!fix this after milestone2 can cause a huge space complexity issue and cause a stack overflow in the memory
              SizedBox(height: 40.0),
              showAlert(),
              SizedBox(height: 20.0),
              buildHeaderText(),
              SizedBox(height: 80.0), Container(  
                      child: Form(
                    key: formKey,
                    child: Column(
                      children: buildInputs() + buildButtons(),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
  //TODO solve this error later.
  // there is text overflow and i dont know how to solve it. its a bug. try to solve it later.
  Widget showAlert(){
    if(_warning != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                  icon: Icon(Icons.close), 
                  onPressed: (){
                    setState(() {
                      _warning = null;
                    });
                  }),
            Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.error_outline),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flexible(child: Text(
                  _warning, 
                  maxLines: 1,
                  overflow: TextOverflow.clip,)),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return SizedBox(height:0,);
  }
  Text buildHeaderText(){
    String _headerText;
    if(authFormType == AuthFormType.signUp){
      _headerText = "Create New Account";
    } else if(authFormType == AuthFormType.reset) {
      _headerText = "Reset Password"; 
    }
    else {
      _headerText = "Sign In";
    }
    return Text(
                _headerText,
                style: TextStyle(fontSize: 30.0,color: Colors.black),
              );
  }

  List<Widget> buildInputs() {
    List<Widget> textFields = [];
    if(authFormType == AuthFormType.reset){
      textFields.add(
        Container(
          width: 350.0,
          child: TextFormField( 
          validator: EmailValidator.validate,//// check 
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            ),
          decoration: buildSignUpInputDecoration("Email"),
          onSaved: (value) => _email = value,
      ),
        ),
      );
          textFields.add(SizedBox(height: 30.0),);
          return textFields;

    }

    // if were in the sign up state add name
    // you can add the tick box here as well.
    if(authFormType == AuthFormType.signUp){
      textFields.add(
        Container(
          width: 350.0,
          child: TextFormField( 
          validator: NameValidator.validate,//// check 
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            ),
          decoration: buildSignUpInputDecoration("Nickname"),
          keyboardType: TextInputType.emailAddress,
          onSaved: (value) => _name = value,
      ),
        ),
      );
          textFields.add(SizedBox(height: 30.0),);
    }
    

    // add email & password
    textFields.add(
      Container(
        width: 350.0,
        child: TextFormField(
          validator: EmailValidator.validate,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
          decoration: buildSignUpInputDecoration("Email"),
          onSaved: (value) => _email = value,
        ),
      ),
    );
    textFields.add(SizedBox(height: 30.0),);
    textFields.add(
      Container(
        width: 350.0,
        child: TextFormField(
          validator: PasswordValidator.validate,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black),
          decoration: buildSignUpInputDecoration("Password"),
          onSaved: (value) => _password = value,
          obscureText: true,
        ),
      ),
    );
    textFields.add(SizedBox(height: 30.0),);

    return textFields;
  }

  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      //filled: true,
      fillColor: Colors.black,
      focusColor: Colors.black,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3.0),
          borderRadius: BorderRadius.circular(70.0),
          ),
      contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    );
  }

  List<Widget> buildButtons() {
    String _switchButtonText, _newFormState, _submitButtonText;
    bool _showForgotPassword = false;

    if( authFormType == AuthFormType.signIn){
      _switchButtonText = 'Create New Account';
      _newFormState =  "signUp";
      _submitButtonText = "Sign In";
      _showForgotPassword = true;
    } else if (authFormType == AuthFormType.reset){
      _switchButtonText = 'Return to Sign In';
      _newFormState =  "signIn";
      _submitButtonText = "Submit";
    }
    
    else {
      _switchButtonText = "Have an account? Sign In";
      _newFormState =  "signIn";
      _submitButtonText = "Sign Up";
    }
    return [
      Container(
        width: 350.0,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
            color: Colors.white,
            textColor: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_submitButtonText,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500
              )
              ),
            ),
            onPressed: submit
          ),   
      ),
      showForgotPassword(_showForgotPassword),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          onPressed: () {
            switchFormState(_newFormState);
          }, 
          child: Text(_switchButtonText, style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 25.0,
            fontStyle: FontStyle.italic,
            ),),

          ),
      )

    ];
  }
  Widget showForgotPassword(bool visible){
    return Visibility(
          child: FlatButton(
        child: Text("Forgot Password?", style: TextStyle(
          color : Colors.black,
          fontSize: 20.0,
          ),
      ),

      onPressed: () {
        setState(() {
          authFormType = AuthFormType.reset;
        });
      },
      ),
      visible: visible,
    );
  }
}
