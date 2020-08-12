import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LandingScreen extends StatefulWidget {
  createstate() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              'something'
            )
            )
        ],
      )
    );
  }
}