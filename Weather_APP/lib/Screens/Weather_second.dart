import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather_second extends StatefulWidget {

  const Weather_second({super.key});

  @override
  State<Weather_second> createState() => _Weather_secondState();
}

class _Weather_secondState extends State<Weather_second> {
  String? _city;
  String? _temperature;
  String? _humidity;
  String? _airPressure;
  final _cityController = TextEditingController();
  final String _apiKey = '5bd7a27bebc6db6a9dfdc53748a3bbc2';

  Future<void> _FetchTemperature(String city) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final temp = data['main']['temp'];
      final humidity = data['main']['humidity'];
      final airPressure = data['main']['pressure'];
      setState(() {
        _temperature = '$temp °C';
        _humidity='$humidity %';
        _airPressure='$airPressure hPa';
      }
      );
    } else {
      setState(() {
        _temperature = 'Error fetching Data';
        _humidity = null;
        _airPressure = null;
      });
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Color(0xff7758D1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: height * 0.2,
                width: width,
                child: Center(
                    child: Image.asset('Assets/Images/cloud_pic.png')),
              ),
              Container(
                height: height * 0.2,
                width: width,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                        hintText: 'Enter City',
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                            fontSize: 17,
                            fontFamily: 'playfont',
                            fontWeight: FontWeight.w500
                        ),
                        filled: true,
                        fillColor: Colors.grey[200]
                    ),
                  ),
                ),
              ),
              //  SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                setState(() {
                  _city = _cityController.text;
                  _FetchTemperature(_city!);
                });
              }, child: Text('Search', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'playfont'
              ),)),
              SizedBox(height: 20,),
              if(_temperature != null)
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Text(
                            'Temperature: $_temperature', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'playfont',
                          color: Colors.tealAccent,)
                        ),),
                      ListTile(
                        title: Text('Humidity: ${_humidity ?? 'N/A'}', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'playfont',
                          color: Colors.tealAccent,)
                        ),),
                      ListTile(
                        title: Text('Pressure: ${_airPressure ?? 'N/A'} ', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'playfont',
                          color: Colors.tealAccent,)
                        ),)
                    ],
                  ),
                ),

            ]
        ),
      )
      ,
    );
  }
}
