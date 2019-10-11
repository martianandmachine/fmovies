import 'package:flutter/material.dart';

class AnimatedFavoriteIcon extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final AnimationController animationController;

  const AnimatedFavoriteIcon(
      {this.animation, this.child, this.animationController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Transform.scale(
          scale: animation.value,
          child: Icon(
            Icons.favorite,
            color: colorAnimation(),
          ),
        );
      },
    );
  }

  Color colorAnimation() {
    return ColorTween(begin: Colors.black54, end: Colors.red)
        .animate(animationController)
        .value;
  }
}
