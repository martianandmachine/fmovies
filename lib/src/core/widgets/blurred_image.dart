import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredImage extends StatelessWidget {
  final String backdropPath;

  BlurredImage(this.backdropPath);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              backdropPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          //applying a blur filter on the image
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
      ),
    );
  }
}
