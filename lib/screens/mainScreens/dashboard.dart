import 'package:flutter/material.dart';
import '../../helpers/helpers.dart';

class DashBoardScreen extends StatelessWidget {
  Widget build(BuildContext context){
    return Scaffold(
      
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

