import'package:flutter/material.dart';
import 'package:prcticeflutter/Screens/Weather_second.dart';
class Weather_front extends StatelessWidget {
  const Weather_front({super.key});

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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffDDB130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              minimumSize: Size(200, 50)
            ),
              onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Weather_second()));
              },
              child: Text('Get Started',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff3E2D8F),
                fontFamily: 'playfont'
              ),))
        ],
      ),
    );
  }
}
