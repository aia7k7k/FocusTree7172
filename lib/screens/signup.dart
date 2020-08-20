import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import '../helpers/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helpers/Utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../servers/services.dart';


class SignupPage extends StatefulWidget {
  createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _fName, _lName;

  final firestoreInstance = Firestore.instance;
  AuthService auth = AuthService();

  Widget build(BuildContext context) {

    var user = Provider.of<FirebaseUser>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(left: 30, top:0, right:30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 0.0),
              //child: SvgPicture.asset(svgLogoTextBlack)
              child: Column(
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                    )
                  ),
                  Text(
                    'FocusTree',
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                    )
                  )
                ]
              )
            ),
            Container(
              padding: EdgeInsets.only(left:15, right:15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField( 
                      validator: (email) {
                        if(email.isEmpty){
                          return 'Provide an email please';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Example: john.yuen@gmail.com',
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                        )
                      ),
                      onSaved: (input) => _email = input
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      validator: (pass) {
                        //if(pass.length < 6 && validateFields(pass)){
                        if(pass.length < 6) {
                          return 'Provide a password that is at lease 6 characters long, with an upper case letter, a lower case letter, 1 numeric number and 1 special character';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Example: Apple123?',
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                        )
                      ),
                      onSaved: (input) => _password = input,
                    ),
                    SizedBox(height:15),
                    TextFormField(
                      validator: (fN) {
                        if(fN.isEmpty) {
                          return 'please provide a first name';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Example: Jayden',
                        labelText: 'FIRST NAME',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                        )
                      ),
                      onSaved: (input) => _fName = input,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      validator: (lN) {
                        if(lN.isEmpty){
                          return 'please provide a last name';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Example: Smith',
                        labelText: 'LAST NAME',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                        )
                      ),
                      onSaved: (input) => _lName = input,
                    )
                  ]
                )
              )
            ),
            /*Container(
              padding: EdgeInsets.only(left:15, right: 15),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Example: john.yuen@gmail.com',
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      )
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Example: Apple123?',
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      )
                    )
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Example: Jayden',
                      labelText: 'FIRST NAME',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      )
                    )
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Example: Parker',
                      labelText: 'LAST NAME',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      )
                    )
                  )
                ]
              )
            ),*/
            Container( //login button
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45.0,
                      child: GestureDetector(
                        onTap: (){
                          //debugPrint('working');
                          _formKey.currentState.save();
                          try{
                            FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
                            /*firestoreInstance.collection('users').document(user.uid).setData(
                              {
                                "firstName" :_fName,
                                "lastName" : _lName
                              }
                            );*/
                            FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
                             auth.getUser.then(
                              (user) {
                                if(user != null) {
                                  Navigator.pushReplacementNamed(context, '/temp');
                                }
                              }
                            );
                          }
                          catch(e){
                            debugPrint(e);
                          }
                          /*_formKey.currentState.save();
                          debugPrint(_password);
                          debugPrint(_email);
                          debugPrint(_lName);
                          debugPrint(_fName);*/
                        },
                        child: Material(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.green,
                              width: 3,
                              style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign up'
                              )
                            ]
                          )
                        )
                      )
                    )
                  ),
                  SizedBox(
                    height: 15
                  ),
                  Container(
                    child: Text(
                      'or'
                    )
                  ),
                  SizedBox(
                    height: 15
                  ),
                  Container(
                    padding: EdgeInsets.only(left:15.0, right:15.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45.0,
                      child: GestureDetector(
                        onTap: () async {
                          //debugPrint('working');

                          var user = await auth.googleSignIn();

                          if(user!= null) {
                            Navigator.pushReplacementNamed(context, '/temp');
                          }

                        },
                        child: Material(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.red,
                              width: 3,
                              style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.google,
                                color: Colors.red
                              ),
                              SizedBox(width: 15.0),
                              Text(
                                'Sign up with Google'
                              )
                            ],
                          )
                        )
                      ),
                    )
                  ),
                  SizedBox(
                    height: 35
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account?",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500
                          )
                        ),
                        SizedBox(width: 5.0),
                        GestureDetector(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500
                            )
                          ),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, '/login');
                          }
                        )
                      ]
                    ),
                  )
                ]
              )
            ),
          ]
        )
      )
    );
  }
  /*void signUp(){

    if(_formKey.currentState.validate()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);

      FirebaseUser user = Provider.of<FirebaseUser>(context);
      firestoreInstance.collection('users').document(user.uid).setData(
        {
          
          "firstName" : _fName,
          "lastName" : _lName
        }
      );
      Navigator.pushReplacementNamed(context, '/temp');
    }
  }*/
}
