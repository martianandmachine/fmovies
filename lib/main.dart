import 'package:flutter/material.dart';
import 'package:fmovies/src/core/app.dart';
import 'package:fmovies/src/core/di/di.dart' as di;

void main() async {
  // We need to access to the binary messenger before `runApp()` has been
  // called (to read `secrets.json`)
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}