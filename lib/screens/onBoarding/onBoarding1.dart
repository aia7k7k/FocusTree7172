import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focusTree2/helpers/const.dart';

class OnBoarding1 extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, top:0, right:30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: SvgPicture.asset(svgLogoTextBlack),
                  ),
                  Text(
                    'Welcome to FocusTree',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left:30, right:30),
              child: SizedBox(
                width: double.infinity,
                height: 45.0,
                child: GestureDetector(
                  onTap: (){
                    //debugPrint("something esle");
                    Navigator.pushReplacementNamed(context, '/onBoarding2');
                  },
                  child: Material( //signup
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30.0),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                        )
                      )
                    )
                  )
                ),
                /*
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.green,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("something else");
                    },
                    child: Center(
                      child: Text(
                        'soemthing',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              )*/
              )
            )
          ],
        )
      )
    );
  }
}