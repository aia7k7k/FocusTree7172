import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helpers/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(65.0, 0.0, 65.0, 0.0),
              child: SvgPicture.asset(svgLogoTextBlack)
            ),
            Container(
              padding: EdgeInsets.only(left:15.0, right: 15.0),
              child: Column(
                children: <Widget>[
                  TextField( //email textfield
                    decoration: InputDecoration(
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
              child: Text(
                'or'
              )
            ),
            Container(
              padding: EdgeInsets.only(left:15.0, right:15.0),
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
                      debugPrint("wokring");
                    }
                  )
                ]
              ),
            )
          ],
        )
      )
    );
  }
}