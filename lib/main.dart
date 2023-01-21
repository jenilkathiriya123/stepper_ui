import 'package:flutter/material.dart';
import 'package:stepper_ui/screens/splash_screen.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home:  splashscreen(),
    ),
  );
}
