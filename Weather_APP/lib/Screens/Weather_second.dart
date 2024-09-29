import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prcticeflutter/widgets/WeatherModel.dart';

class Weather_second extends StatefulWidget {
  const Weather_second({super.key});

  @override
  State<Weather_second> createState() => _Weather_secondState();
}

class _Weather_secondState extends State<Weather_second> {
  String? _city;
  WeatherModel? _Weather;
  final _cityController = TextEditingController();
  final String _apiKey = '5bd7a27bebc6db6a9dfdc53748a3bbc2';

  void initState() {
    super.initState();
    _city = 'Karachi';
    _FetchTemperature(_city!);
  }

  Future<void> _FetchTemperature(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _Weather = WeatherModel.fromJson(data);
      });
    } else {
      setState(() {
        _Weather = null;
      });
      _showErrorDialog('City not found. Please try again.');
    }
    FocusScope.of(context).unfocus();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff7758D1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: height * 0.2,
            width: width,
            child: Center(child: Image.asset('Assets/Images/cloud_pic.png')),
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
                        fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: Colors.grey[200]),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _city = _cityController.text;
                  _FetchTemperature(_city!);
                });
              },
              child: Text(
                'Search',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'playfont'),
              )),
          SizedBox(
            height: 20,
          ),
          if (_Weather != null)
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(
                      _city!,
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Colors.amberAccent,
                          fontFamily: 'playfont'),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.thermostat,
                        color: Colors.orangeAccent,
                        size: 40,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Temperature: ${_Weather?.main?.temp} °C',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'playfont',
                          color: Colors.tealAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  if (_Weather?.main?.humidity != null)
                    Row(
                      children: [
                        Icon(Icons.water_drop,
                            color: Colors.blueAccent, size: 40),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Humidity: ${_Weather?.main?.humidity?.toStringAsFixed(0) ?? 'N/A'} %',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'playfont',
                            color: Colors.tealAccent,
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 10),
                  if (_Weather?.main?.pressure != null)
                    Row(
                      children: [
                        Icon(Icons.speed, color: Colors.greenAccent, size: 40),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Pressure: ${_Weather?.main?.pressure?.toStringAsFixed(0) ?? 'N/A'} hPa ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'playfont',
                            color: Colors.tealAccent,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
        ]),
      ),
    );
  }
}
