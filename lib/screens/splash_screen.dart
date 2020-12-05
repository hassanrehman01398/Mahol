import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mahool/animations/bottomAnimation.dart';
import 'package:mahool/animations/fade_animation.dart';
import 'package:mahool/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
            (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
            }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).primaryColor,
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           FadeAnimation(
             2.0,
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset('images/icon.png'),
               ],
             ),
           ),
           SizedBox(height: 80,),
           WidgetAnimator(
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(right: 30),
                   child: Text("ماحول",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 30),),
                 ),
               ],
             ),
           ),
           SizedBox(height: 40,),
           WidgetAnimator(
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SpinKitCircle(color: Colors.white),
               ],
             ),
           )
         ],
       ),
    );
  }
}
