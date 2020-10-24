import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../servers/services.dart';
<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
=======
>>>>>>> 010202a0f67f93f0bc3ce28c4ef7c543020a2522

class StudySession extends StatefulWidget{
  createState() => StudySessionState();
}

class StudySessionState extends State<StudySession> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
<<<<<<< HEAD
  List<String> sTime = [];
  List<String> bTime = [];
  List<String> presetName = [];
  bool havePreset = false;

  Future getPresets() async {

    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      sTime = pref.getStringList('sTime');
      bTime = pref.getStringList('bTime');
      presetName = pref.getStringList('presetList');
      havePreset = pref.getBool('havePreset');

      if(havePreset==null){
        havePreset=false;
      }
    }
    catch(e){
      
    }
  }

  Widget build(BuildContext context){
    getPresets();
    return new Scaffold(
      body: Column(
        children: [
          Text("something"),
          SizedBox(height:20),
          checkShowPreset()
        ],
=======

  Widget build(BuildContext context){
    return new Scaffold(
      body: Container(
        
>>>>>>> 010202a0f67f93f0bc3ce28c4ef7c543020a2522
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
<<<<<<< HEAD
  Widget checkShowPreset() {

    if(havePreset==false){
      return Container(
        child: Text('something')
      );
    }
    else {
      return Container(
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: sTime.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 50,
              color: Colors.green,
              child: Center(
                child: Text("something")
              )
            );
          }
        )
      );
    }
  }
=======
>>>>>>> 010202a0f67f93f0bc3ce28c4ef7c543020a2522
}