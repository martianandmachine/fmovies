import 'package:flutter/material.dart';
import 'package:fmovies/src/features/splash/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        accentColor: Colors.cyanAccent[500],
        brightness: Brightness.dark,
      ),
      home: SplashPage(),
    );
  }
}
