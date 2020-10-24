import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../helpers/helpers.dart';

class DashBoardScreen extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  Widget build(BuildContext context){
    return Scaffold(

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
        fixedColor: Colors.lightGreen,
        currentIndex: 0,
        onTap: (int idx) {
          switch(idx){
            case 0:
            break;
            case 1:
              Navigator.pushReplacementNamed(context, '/studySession');
            break;
          }
        },
      ),
    );
  }
}

