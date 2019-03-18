import 'package:elmaktaba/UI/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenW extends StatefulWidget{
  SplashLess createState() => new SplashLess();

}
class SplashLess extends State<SplashScreenW>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
    Container(
      child:
          Stack(children: <Widget>[
            Image.asset(
              'assets/image/back.jpeg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,

            )
            ,
            new  SplashScreen(
              seconds: 5,
              navigateAfterSeconds: new MyHomePage(),
              backgroundColor: Color.fromRGBO(0,0, 0, 0.0),
              title: Text(""),
              styleTextUnderTheLoader: TextStyle(color:Color.fromRGBO(0,0, 0, 0.0)),
              loaderColor: Color.fromRGBO(0,0, 0, 0.0),

            ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Color.fromRGBO(0,0, 0, 0.5),
              ),
              Container(
                 child:



                Positioned(child:

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[


                    Text("مرحبا بك في" , style: TextStyle(color: Colors.white , fontSize: 25 ,),),
                Padding(padding: EdgeInsets.only(right: 20, left: 5 , bottom: 40) ,
                    child:
                    Text("المكتبة", style: TextStyle(color: Colors.white , fontSize: 60 ,fontWeight: FontWeight.bold),))
                  ],
                ) ,
                  bottom: 0,
                  right: 0,
                )
              ,)
          ],
          )

    ),
    );
      
      
  }

}