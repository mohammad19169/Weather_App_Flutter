import 'package:flutter/material.dart';
import 'package:prcticeflutter/Screens/Weather_front.dart';
import 'package:prcticeflutter/Screens/Weather_second.dart';
import 'package:prcticeflutter/widgets/Api_Integration.dart';
import 'package:prcticeflutter/widgets/BottomSheet.dart';
import 'package:prcticeflutter/widgets/MyAlertDialog.dart';
import 'package:prcticeflutter/widgets/MyAnimatedText.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amberAccent,
        cardColor: Colors.white54
      ),
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,

      home: Weather_front(),
    );
  }
}



