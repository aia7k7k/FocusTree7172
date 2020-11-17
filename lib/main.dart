import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focusTree2/screens/mainScreens/study.dart';
import 'package:focusTree2/screens/mainScreens/study2.dart';
import 'package:focusTree2/screens/mainScreens/studyCreate.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'servers/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthService().user)
      ],

      child: MaterialApp(
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())
        ],

        routes: {
          '/': (context) => LandingScreen(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          '/temp': (context) => TempPage(),
          '/onBoarding1': (context) => OnBoarding1(),
          '/onBoarding2': (context) => OnBoarding2(),
          '/onBoarding3': (context) => OnBoarding3(),
          '/dashBoard' : (context) => DashBoardScreen(),
          '/studySession': (context) => StudySession(),
          '/studyCreate': (context) => StudyCreate(),
          '/study2' : (context) => StudySession2()
        }
      )
    );
  }
}

