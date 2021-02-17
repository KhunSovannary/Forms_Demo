import 'package:flutter/material.dart';
import 'package:forms_demo/form_demo.dart';
void main() {
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Forms Demo",
      theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
      home: FormsDemo(),
    );
  }
}
