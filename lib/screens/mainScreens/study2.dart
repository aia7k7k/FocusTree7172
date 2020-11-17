import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../servers/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StudySession2 extends StatefulWidget{
  createState() => StudySession2State();
}

class StudySession2State extends State<StudySession2> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<bool> _haveP;
  String presetName = '';
  int presetSTime = 0;
  int presetBTime = 0;

  Future<bool> havePreset() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool _havePreset = pref.getBool('havePreset');
    return _havePreset;
  }

  Widget build(BuildContext context){
    _haveP = havePreset();
    return new Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                betterTest("Pomodoro Technique",25,5),
                betterTest("Flow Technique (45min)",45,8),
                betterTest("Flow Technique (75min)",75,10),
                betterTest("Flow Technique (100min)",100,15),
                betterTest("Sunnie's Personal",5,20),
                betterTest("Addison's Classic",0,60),
              ])
            )
          ]
        )
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
  /*Widget checkShowPreset() {

    if(_noPreset!=false){
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
  }*/

  Widget returnSomething() {
    presetName = "TestPreset1";
    presetSTime = 60;
    presetBTime = 20;

    return Container(
      height: 100,
      child: GestureDetector(
        child: Container(
          child: Column(
            children: [
              Text("test"),
              SizedBox(height:5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Studying Time"+presetSTime.toString()),
                  Text("Break Time"+presetBTime.toString())
                ],
              )
            ],
          )
        )
      )
    );
  }

  Widget testWidget(){

    return Container(
      child: Text("test")
    );
  }

  Widget betterTest(String name, int s, int b){
    presetSTime = s;
    presetBTime = b;

    return Container(
      padding: EdgeInsets.all(15),
      height:125,
      child: GestureDetector(
        child: Material(
          color: Colors.green[300],
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.green[300],
              width:3,
              style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Container(
            padding: EdgeInsets.all(11),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 17
                  )
                ),
                SizedBox(height:5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Study Time: "+presetSTime.toString()+"min",
                      style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 14
                  )
                    ),
                    Text("Break TIme: "+presetBTime.toString()+"min",
                    style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 14
                  ))
                  ],
                )
              ],
            ),
          )
        ),
      )
    );
  }
  
}