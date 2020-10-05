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
        child: Center(
          child: FlatButton(
            child: Text('logout'),
            onPressed: () async{
                  try {
                    await auth.signOut();
                    await _googleSignIn.signOut();
                  }
                  catch(e){
                    debugPrint(e);
                  }
                  Navigator.pushReplacementNamed(context, '/');
                },
          )
        )
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
        fixedColor: Colors.greenAccent,
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