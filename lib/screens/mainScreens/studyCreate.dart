import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';

class StudyCreate extends StatefulWidget {
  createState() => StudyCreateState();
}

class StudyCreateState extends State<StudyCreate> {

  List<String> sTimeTemp = [];
  List<String> bTimeTemp = [];
  List<String> presetNameTemp = [];

  int endTime2, endTime, initTime, initTime2, laps1, endHour, endMin, percentTime;

  void initState() {
    super.initState();
    _shuffle();
  }

  Future savePreset(int sTime, int bTime, String presetName) async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    sTimeTemp = pref.getStringList('sTime');
    bTimeTemp = pref.getStringList('bTime');
    presetNameTemp = pref.getStringList('presetName');

    sTimeTemp.add(sTime.toString());
    bTimeTemp.add(bTime.toString());
    presetNameTemp.add(presetName);

    pref.setStringList('sTime', sTimeTemp);
    pref.setStringList('bTime', bTimeTemp);
    pref.setStringList('presetName', presetNameTemp);

  }

  int _generateRandomTime() => Random().nextInt(120);
  int _generateRandomTime2() => Random().nextInt(60);

  void _shuffle() {
    setState(() {
      initTime = _generateRandomTime();
      endTime = initTime;
      initTime2 = _generateRandomTime2();
      endTime2 = initTime2;
      laps1 = 0;
      endHour = 0;
      endMin = 0;
    });
  }

  void _updateLabels(int init, int end, int laps){
    setState(() {
      endTime = end;
    });
  }

  void _updateLabelsTheSequal(int init, int end, int laps){
    setState(() {
      endTime2 = end;
      laps1 = laps;
    });
  }

  String chooseDisplay(int eH, int eM) {
    if(eH == 0){
      return 'Total Time of Session: '+ eM.toString()+ 'min';
    }
    else{
      return 'Total Time of Session: '+ eH.toString()+'hour'+ ' '+ eM.toString()+ 'min';
    }
  }

  String chooseDisplay2(int sH, int sM){
    if(sH == 0){
      return 'Total Time of Studying: '+ sM.toString()+ 'min';
    }
    else{
      return 'Total Time of Studying: '+ sH.toString()+'hour'+ ' '+ sM.toString()+ 'min';
    }
  }

  Widget build(BuildContext context){

    int tTime = endTime2+(laps1*60);

    int endHour = ((endTime2+(laps1*60))~/60).toInt();
    int endMin = (tTime-(endHour*60)).toInt();

    double percentTime = endTime/120;
    int studyTime = (((endHour*60)+endMin)*percentTime).toInt(); 

    int studyHour = studyTime~/60;
    int studyMin = studyTime%60;
      return Scaffold(
        //backgroundColor: Colors.blue[100],
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child:Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:30, right: 30),
                          child: SingleCircularSlider(
                            60, 
                            endTime2,
                            shouldCountLaps: true,
                            onSelectionChange: _updateLabelsTheSequal,
                            baseColor: Colors.red[100],
                            selectionColor: Colors.green[200],
                            height: 160,
                            width: 160,
                          )
                        ),
                        SizedBox(height: 10),
                        Text(chooseDisplay(endHour, endMin))
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(left:30, right: 30),
                      child: SingleCircularSlider(
                        120, 
                        endTime,
                        onSelectionChange: _updateLabels,
                        baseColor: Colors.red[100],
                        selectionColor: Colors.green[200],
                        )
                    ),
                    Container(
                      padding: EdgeInsets.only(left:50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(chooseDisplay2(studyHour, studyMin))
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      
                      child: FlatButton( //login
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(side: BorderSide(
                          color: Colors.green[200],
                          width: 3,
                          style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Text(
                          'Create Preset',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.green[300]
                          )
                        ),
                        onPressed: (){
                          //debugPrint("something");
                        },
                      ),
                    )
                  ],
                )
              )
            ]
          )
        ),
        appBar: AppBar(
          title: const Text(
            "Create a preset",
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
              Navigator.pushReplacementNamed(context, '/studySession');
            },
            color: Colors.lightGreen,)
          ],
        ),
      );
    }
  }
