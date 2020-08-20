import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../servers/services.dart';

class TempPage extends StatelessWidget {

  Widget build(BuildContext context) {

    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(
                'smt'
              ),
              SizedBox(height: 20),
              FlatButton(
                child: Text(
                  'sign out'
                ),
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
            ],
          ),
        )
      )
    );
  }
}