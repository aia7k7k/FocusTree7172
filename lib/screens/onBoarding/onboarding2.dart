import 'package:flutter/material.dart';

class OnBoarding2 extends StatelessWidget{

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Focus', style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 30
                  ),),
                  SizedBox(width:2),
                  Text('Tree', style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize:30
                  )),
                ],
              )
            ),
            
            Container(
              padding: EdgeInsets.only(left:50, right: 50),
              child: SizedBox(
                width: double.infinity,
                height: 45.0,
                child: GestureDetector(
                  onTap: (){
                    //debugPrint("something esle");
                    Navigator.pushReplacementNamed(context, '/onBoarding3');
                  },
                  child: Material( //signup
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30.0),
                    child: Center(
                      child: Text(
                        'Next',
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
      ),
    );
  }
}