import 'package:cv/pages/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      themeMode: ThemeMode.system,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
