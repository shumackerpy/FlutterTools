import 'package:flutter/material.dart';
import 'package:toolbox/screens/home_screen.dart';
import 'package:toolbox/screens/age_screen.dart';
import 'package:toolbox/screens/gender_screen.dart';
import 'package:toolbox/screens/about_screen.dart';
import 'package:toolbox/screens/news_screen.dart';
import 'package:toolbox/screens/university_screen.dart';
import 'package:toolbox/screens/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toolbox App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/gender': (context) => GenderScreen(),
        '/age': (context) => AgeScreen(),
        '/universities': (context) => UniversityScreen(),
        '/weather': (context) => WeatherScreen(),
        '/news': (context) => NewsScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
