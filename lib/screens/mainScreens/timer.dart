import 'package:flutter/material.dart';


class TimerTest1 extends StatefulWidget{
  createState() => TimerTest1State();
}

class TimerTest1State extends State<TimerTest1> {

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Study Timer",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.lightGreen,
            fontSize: 25
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        actions: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.pushReplacementNamed(context, '/study2');
          }, 
          color: Colors.lightGreen,)
        ],
      ),
      body:Container(
        
      )
    );
  }
}