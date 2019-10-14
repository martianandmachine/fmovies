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
    return TweenSequence(
      <TweenSequenceItem<Color>>[
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.black54, end: Color(0xFF9E635F)),
          weight: 16.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFF9E635F), end: Color(0xFFC9534A)),
          weight: 15.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFC9534A), end: Colors.red),
          weight: 16.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.red, end: Color(0xFFC9534A)),
          weight: 17.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFC9534A), end: Color(0xFF9E635F)),
          weight: 18.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFF9E635F), end: Colors.black54),
          weight: 18.0,
        ),
      ],
    ).animate(animationController).value;
  }
}
