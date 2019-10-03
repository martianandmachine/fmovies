import 'package:flutter/material.dart';

class ShowSnackBar {

  ShowSnackBar(BuildContext context, String message){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
