import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:auto_size_text/auto_size_text.dart';
import '../helpers/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helpers/Utilities.dart';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import '../servers/services.dart';


class SignupPage extends StatefulWidget {
  createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _fName, _lName, _errorCode, _errorField;

  final firestoreInstance = Firestore.instance;
  AuthService auth = AuthService();

  Widget build(BuildContext context) {

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
                      obscureText: true,
                    ),
                  ]
                )
              )
            ),
            showError(),
            Container( //login button
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45.0,
                      child: GestureDetector(
                        onTap: () async{
                          //debugPrint('working');
                          _formKey.currentState.save();
                          try{
                            final _trimmedEmail = _email.trim();
                            final _trimmedPassword = _password.trim();

                            await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _trimmedEmail, password: _trimmedPassword);

                            auth.getUser.then(
                              (user) {
                                if(user != null) {
                                  Navigator.pushReplacementNamed(context, '/temp');
                                }
                              }
                            );
                          }
                          catch(e){
                            _errorCode = e.code.toString();
                            setState(() {
                              _errorField = _ErrorMsg(_errorCode);
                            });
                          }
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

  Widget showError(){
    if(_errorField != null){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              child: Icon(Icons.error_outline),
              padding: EdgeInsets.only(right: 8.0)
            ),
            Expanded(
              child: AutoSizeText(_errorField, maxLines: 3),
            )
          ],
        )
      );
    }
    else return SizedBox(height: 0.0);
  }

  String _ErrorMsg(String error) {
    if(Platform.isAndroid) {
      switch(error) {
        case("ERROR_EMAIL_ALREADY_IN_USE"): {
          return "The email address is already in use by another account";
        }
        break;

        case("ERROR_WEAK_PASSWORD"): {
          return "Your password should be at least 6 characters";
        }
        break; 

        case("ERROR_INVALID_EMAIL"): {
          return "The email address is badly formatted";
        }
        break;
      }
    }
  }
}
