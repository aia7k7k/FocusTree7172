import 'package:flutter/material.dart';

class OnBoarding3 extends StatelessWidget{

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'onBoarding3'
              ),
            ),
            Container(
              padding: EdgeInsets.only(right:50, left:50),
              child:SizedBox(
                width: double.infinity,
                height: 45.0,
                child: GestureDetector(
                  onTap: (){
                    //debugPrint("something esle");
                    Navigator.pushReplacementNamed(context, '/');
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