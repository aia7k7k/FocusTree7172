import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../servers/services.dart';

class StudySession extends StatefulWidget{
  createState() => StudySessionState();
}

class StudySessionState extends State<StudySession> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Widget build(BuildContext context){
    return new Scaffold(
      body: Container(
        
      ),

      appBar: AppBar(
        title: const Text(
          "Study Session",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.lightGreen,
            fontSize: 25
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.pushReplacementNamed(context, '/studyCreate');
          }, 
          color: Colors.lightGreen,)
        ],
      ),
  
      bottomNavigationBar: BottomNavigationBar(items:
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Dashboard')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_on),
            title: Text('Study Session')
          )
        ].toList(),
        fixedColor: Colors.lightGreen,
        currentIndex: 1,
        onTap: (int idx) {
          switch(idx){
            case 0:
              Navigator.pushReplacementNamed(context, '/dashBoard');
            break;
            case 1:
            break;
          }
        },
      ),
    );
  }
}