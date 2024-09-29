import 'dart:async';

import'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prcticeflutter/Screens/Weather_second.dart';
class Weather_front extends StatefulWidget {
  const Weather_front({super.key});

  @override
  State<Weather_front> createState() => _Weather_frontState();
}

class _Weather_frontState extends State<Weather_front> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Weather_second()));
    });
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff7758D1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xff7758D1),
            height: height*0.5,
            width: width,
            child: Center(child: Image.asset('Assets/Images/cloud_pic.png')),
          ),
          Container(
           // color: Color(0xff3E2D8F),
            height: height*0.2,
            width: width,
            child: Center(
              child: RichText(text: const TextSpan(
                text: '  Weather',style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),children:[ TextSpan(
                text: '\nForeCasts',style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xffDDB130)
              )
              )]
              ),
              ),

            ),
          ),
          SpinKitDoubleBounce(
            color: Color(0xff42A5F5),
    size: 50.0,
    ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Color(0xffDDB130),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30)
          //     ),
          //     minimumSize: Size(200, 50)
          //   ),
          //     onPressed: (){
          //     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Weather_second()));
          //     },
          //     child: Text('Get Started',style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w600,
          //       color: Color(0xff3E2D8F),
          //       fontFamily: 'playfont'
          //     ),))
        ],
      ),
    );
  }
}
