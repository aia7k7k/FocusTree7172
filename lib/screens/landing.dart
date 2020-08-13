import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helpers/const.dart';

class LandingScreen extends StatefulWidget {
  createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
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
                    child: FlatButton(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(side: BorderSide(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Text(
                        'something'
                      ),
                      onPressed: (){
                        debugPrint("something");
                      },
                    )
                  ),
                  SizedBox(height: 15.0),
                  SizedBox(
                    width: double.infinity,
                    height: 45.0,
                    child: GestureDetector(
                      onTap: (){
                        debugPrint("something esle");
                      },
                      child: Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30.0),
                        child: Center(
                          child: Text(
                            'something',
                            style: TextStyle(
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