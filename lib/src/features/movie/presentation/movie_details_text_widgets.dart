import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsTextWidgets {
  Widget buildSectionTitle(String text) {
    return AutoSizeText(
      text,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.cyanAccent,
            blurRadius: 2.0,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      minFontSize: 10,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black,
            blurRadius: 1.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
    );
  }

  Widget buildCastName(String name, String character) {
    return Text(
      name + '\n[$character]',
      maxLines: 2,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black,
            blurRadius: 1.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
    );
  }

  Widget buildTagline(String text) {
    return TyperAnimatedTextKit(
      text: [text],
      duration: Duration(seconds: 2),
      isRepeatingAnimation: false,
      textStyle: TextStyle(
        fontSize: 24,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.cyanAccent,
            blurRadius: 2.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
    );
  }

  Widget buildTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.red,
            blurRadius: 2.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
    );
  }
}
