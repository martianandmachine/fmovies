import 'package:flutter/material.dart';
import 'package:fmovies/src/core/app.dart';
import 'package:fmovies/src/core/di/di.dart' as di;

void main() async {
  await di.init();
  runApp(App());
}