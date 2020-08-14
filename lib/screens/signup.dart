import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: unused_import
import '../helpers/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupPage extends StatefulWidget {
  createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(left: 30, top:0, right:30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: SvgPicture.asset(svgLogoTextBlack)
            ),
            Container(
              padding: EdgeInsets.only(left:15, right: 15),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'john.yuen@gmail.com',
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
                      hintText: 'Apple123?',
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
                  )
                ]
              )
            ),
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
                          'Sign up'
                        )
                      ]
                    )
                  )
                )
              )
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
                          'Sign up with Google'
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
      )
    );
  }
}