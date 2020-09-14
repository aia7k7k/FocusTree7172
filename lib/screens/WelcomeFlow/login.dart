import 'package:flutter/material.dart';
import '../../helpers/const.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:io';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../servers/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  AuthService auth = AuthService();
  String _errorCode, _errorField;

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(left: 30, top:0, right:30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 0.0),
              //child: SvgPicture.asset(svgLogoTextBlack)
              child: Column(
                children: [
                  Text(
                    'Sign in',
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
              padding: EdgeInsets.only(left:15.0, right: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        TextFormField(
                          validator: (email) {
                            if(email.isEmpty){
                              return 'please provide a last name';
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Example: example@gmail.com',
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
                          onSaved: (input) => _email = input,
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          obscureText: true,
                          validator: (password) {
                            if(password.isEmpty){
                              return 'please provide a last name';
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
                        Container(
                          alignment: Alignment(1.0,0.0),
                          padding: EdgeInsets.only(top:15.0, left:20),
                          child: GestureDetector(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.green
                              )
                            ),
                            onTap: (){
                              //debugPrint("works");
                            }
                          )
                        ),
                      ],
                    )
                  ],
                )
              )
            ),
            showError(),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45.0,
                      child: GestureDetector(
                        onTap: () async{
                           _formKey.currentState.save();
                           try{
                              final _trimmedEmail = _email.trim();
                              final _trimmedPassword = _password.trim();
                              await FirebaseAuth.instance.signInWithEmailAndPassword(email: _trimmedEmail, password: _trimmedPassword);
                              auth.getUser.then(
                              (user) {
                                if(user != null) {
                                  Navigator.pushReplacementNamed(context, '/dashBoard');
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
                                'Login'
                              )
                            ]
                          )
                        )
                      )
                    )
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Text(
                      'or'
                    )
                  ),
                  SizedBox(
                    height: 15
                  ),
                  Container( // login with google
                    padding: EdgeInsets.only(left:15.0, right:15.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45.0,
                      child: GestureDetector(
                        onTap: () async {
                          //debugPrint('working');
                          var user = await auth.googleSignIn();

                          if(user!= null) {
                            Navigator.pushReplacementNamed(context, '/dashBoard');
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
                                'Sign in with Google'
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
                          "Don't have an account?",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500
                          )
                        ),
                        SizedBox(width: 5.0),
                        GestureDetector(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500
                            )
                          ),
                          onTap: (){
                            Navigator.pushReplacementNamed(context, '/signup');
                          }
                        )
                      ]
                    ),
                  )
                ]
              )
            ),
          ],
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
    else return SizedBox(height:0);
  }

  String _ErrorMsg(eMsg) {
    if(Platform.isAndroid){
      switch(eMsg){
        case "ERROR_WRONG_PASSWORD": {
          return "The password is invalid or the user does not have a password";
        }
        break;

        case "ERROR_USER_NOT_FOUND": {
          return "There is no user record corresponding to this identifier. The user may have been deleted";
        }
        break;

        case "error":{
          return "Please fill in all the fields";
        }
      }
    }
  }
}