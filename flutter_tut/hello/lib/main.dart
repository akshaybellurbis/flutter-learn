import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: Center(
          child: Text(
            "hi i am akshay",
            style: new TextStyle(
              fontSize: 40.0,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
