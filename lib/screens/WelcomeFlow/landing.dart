import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helpers/const.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../../servers/services.dart';

class LandingScreen extends StatefulWidget {
  createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {

  AuthService auth = AuthService();

  void initState() {
    super.initState();
    auth.getUser.then(
      (user) {
        if(user != null) {
          Navigator.pushReplacementNamed(context, '/temp');
        }
      }
    );
    new Timer(new Duration(milliseconds: 200), () {
      checkFirstTime();
    });
  }

  Future checkFirstTime() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seenFirst')?? false);

    if (!_seen) { //have not seen onboarding
      //prefs.setBool('seenFirst', true);
      Navigator.pushReplacementNamed(context, '/onBoarding1');
    }

  }

  Widget build(BuildContext context){
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
              child: SvgPicture.asset(svgLogoTextBlack)
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 45.0,
                    child: FlatButton( //login
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(side: BorderSide(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: Colors.black
                        )
                      ),
                      onPressed: (){
                        //debugPrint("something");
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    )
                  ),
                  SizedBox(height: 15.0),
                  SizedBox(
                    width: double.infinity,
                    height: 45.0,
                    child: GestureDetector(
                      onTap: (){
                        //debugPrint("something esle");
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      child: Material( //signup
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30.0),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            )
                          )
                        )
                      )
                    ),
                    /*
                    child: Material(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.green,
                      child: GestureDetector(
                        onTap: () {
                          debugPrint("something else");
                        },
                        child: Center(
                          child: Text(
                            'soemthing',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    )
                  )*/
                  )
                ]
              ),
              /*
              child: FlatButton(
                child: Text(
                  'Sign in'
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: null
              ),*/
            )
          ]
        )
      )
    );
  }
}