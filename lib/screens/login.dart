import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helpers/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../servers/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  AuthService auth = AuthService();

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
              child: Column(
                children: <Widget>[
                  TextField( //email textfield
                    decoration: InputDecoration(
                      hintText: 'Example: john.yuan@gmail.com',
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      )
                    ),
                  ),
                  SizedBox(height: 20.0), //spacer
                  TextField( //Password textfield
                    decoration: InputDecoration(
                      hintText: 'Example: Apple123?',
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      )
                    ),
                  ),
                  Container(
                    alignment: Alignment(1.0,0.0),
                    padding: EdgeInsets.only(top:15.0, left:20),
                    child: GestureDetector(
                      child: Text(
                        'Forget Pasword',
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
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45.0,
                      child: GestureDetector(
                        onTap: (){
                          debugPrint('working');
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
}