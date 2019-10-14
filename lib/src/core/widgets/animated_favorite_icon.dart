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
          tween: ColorTween(begin: Color(0xFFC1C1C1), end: Color(0xFFD29793)),
          weight: 16.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFD29793), end: Color(0xFFE36D64)),
          weight: 15.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFE36D64), end: Colors.red),
          weight: 16.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.red, end: Color(0xFFE36D64)),
          weight: 17.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFE36D64), end: Color(0xFFD29793)),
          weight: 18.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFD29793), end: Color(0xFFC1C1C1)),
          weight: 18.0,
        ),
      ],
    ).animate(animationController).value;
  }
}
