import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(AgroKartApp());
}

class AgroKartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroKart BD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(),
    );
  }
}
