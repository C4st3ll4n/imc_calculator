import 'package:flutter/material.dart';
import 'package:imc_calculator/screen/HomePage.dart';
import 'package:imc_calculator/screen/ResultPage.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/result': (context) => ResultPage(),
      },
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
    ));
