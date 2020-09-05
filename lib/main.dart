import 'package:boboboe/views/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'boboboe(covidTracker)',
      theme:
          ThemeData(primarySwatch: Colors.teal, accentColor: Colors.tealAccent),
      home: Home(),
    );
  }
}
