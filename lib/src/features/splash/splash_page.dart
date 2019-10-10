import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/di/di.dart';
import 'package:fmovies/src/features/home/domain/tab_bloc.dart';
import 'package:fmovies/src/features/home/presentation/home_page.dart';

const int _SPLASH_DURATION = 3;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    loadData();

    super.initState();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: _SPLASH_DURATION), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return BlocProvider<TabBloc>(
        builder: (context) => getIt<TabBloc>(),
        child: HomePage(),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg_splash.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
    );
  }
}
