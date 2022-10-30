import 'package:buisness/screens/authentiction/logIn.dart';
import 'package:buisness/screens/mainApp/navBar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(context) =>
      const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: logIn()
      );
}

