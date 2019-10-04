import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailsTextWidgets {
  Widget buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black,
            blurRadius: 2.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
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

  Widget buildTagline(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black,
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
