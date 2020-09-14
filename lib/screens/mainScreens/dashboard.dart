import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: 
      const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Dashboard')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm_on),
          title: Text('Study Session')
        )
      ]
      ),
    );
  }
}